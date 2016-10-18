#!/bin/bash

module add R/3.2.2

echo "Downloading cDNA"
wget -q ftp://ftp.ensembl.org/pub/release-$1/fasta/homo_sapiens/cdna/Homo_sapiens.GRCh38.cdna.all.fa.gz

echo "Downloading ncRNA"
wget -q ftp://ftp.ensembl.org/pub/release-$1/fasta/homo_sapiens/ncrna/Homo_sapiens.GRCh38.ncrna.fa.gz

echo "Downloading GTF"
wget -q ftp://ftp.ensembl.org/pub/release-$1/gtf/homo_sapiens/Homo_sapiens.GRCh38.$1.gtf.gz

echo "Creating transcripts file"
zcat Homo_sapiens.GRCh38.cdna.all.fa.gz Homo_sapiens.GRCh38.ncrna.fa.gz > Homo_sapiens.GRCh38.transcripts.fa

echo "Number of transcripts in transcripts file:"
cat Homo_sapiens.GRCh38.transcripts.fa | grep "^>" \
                                       | awk '{print $1}' | sed -e 's/>//' \
                                       | awk -F"." '{print $1}' > transcript_ids_from_fasta
wc -l transcript_ids_from_fasta

echo "Number of transcripts in GTF file:"
zcat Homo_sapiens.GRCh38.$1.gtf.gz | awk '$3=="transcript"' \
                                   | awk -F"transcript_id \"" '{print $2}' \
                                   | awk -F"\";" '{print $1}' > transcript_ids_from_gtf
wc -l transcript_ids_from_gtf


setdiff.R transcript_ids_from_fasta transcript_ids_from_gtf > ufasta.txt
setdiff.R transcript_ids_from_gtf transcript_ids_from_fasta > ugtf.txt

echo "Transcripts in FASTA but not in GTF:"
wc -l ufasta.txt

echo "Transcripts in GTF but not in FASTA:"
wc -l ugtf.txt

echo "The transcripts unique to the FASTA file are from:"
cat Homo_sapiens.GRCh38.transcripts.fa \
                                | grep -f ufasta.txt | awk -F"GRCh38:" '{print $2}' \
                                | awk -F":" '{print $1}' | sort -u > chrs_from_ufasta
cat chrs_from_ufasta

echo "The transcripts unique to the GTF file are of type:"
zcat  Homo_sapiens.GRCh38.$1.gtf.gz | awk '$3=="transcript"' \
                                    | grep -f ugtf.txt | awk -F"gene_biotype \"" '{print $2}' \
                                    | awk -F"\";" '{print $1}' | sort | uniq -c

echo "The transcripts NOT unique to the GTF file are of type:"
zcat  Homo_sapiens.GRCh38.$1.gtf.gz | awk '$3=="transcript"' \
                                    | grep -v -f ugtf.txt | awk -F"gene_biotype \"" '{print $2}' \
                                    | awk -F"\";" '{print $1}' | sort | uniq -c
