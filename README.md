# Ensembl_GTF_FASTA_test
Hacky scripts to compare Ensembl GTF to FASTA files.

Downloads data from the Ensembl FTP server and saves locally, so make sure you have space.

The associated script setdiff.R will need to be in your path and executable, and you'll need Rscript in your path.

The gtftest.sh script does all sorts of awk, sed, sort, uniq and grep gymnastics that none of us would be proud of, but who has time to do things properly??

Only argument is the Ensembl release number (it'll only work for GRCh38 releases)

```R
# release 83
gtftest.sh 83

# release 86
gtftest.sh 86
```




