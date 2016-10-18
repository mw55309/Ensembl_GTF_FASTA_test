# Ensembl_GTF_FASTA_test
Hacky scripts to compare Ensembl GTF to FASTA files.  

Basically if you compare Ensembl GTF files to the Ensembl FASTA files, they don't contain the same transcripts.

The scripts download data from the Ensembl FTP server and saves locally, so make sure you have space.

The associated script setdiff.R will need to be in your path and executable, and you'll need Rscript in your path.

The gtftest.sh script does all sorts of awk, sed, sort, uniq and grep gymnastics that none of us would be proud of, but who has time to do things properly??

Only argument is the Ensembl release number (it'll only work for GRCh38 releases)

```R
# release 83
gtftest.sh 83

# release 86
gtftest.sh 86
```

Rather annoyingly, behaviour of Ensembl has changed between release 83 and 86:

<pre>
<b># release 83</b>
...
The transcripts unique to the GTF file are of type:
   <b>2306 misc_RNA</b>
   1069 TEC
The transcripts NOT unique to the GTF file are of type:
...
  12648 lincRNA
      1 macro_lncRNA
   4198 miRNA
      2 Mt_rRNA
     22 Mt_tRNA
      3 non_coding
...

<b># release 86</b>
...
The transcripts unique to the GTF file are of type:
   1066 TEC
The transcripts NOT unique to the GTF file are of type:
...
  12440 lincRNA
      1 macro_lncRNA
   1567 miRNA
   <b>2221 misc_RNA</b>
      2 Mt_rRNA
     22 Mt_tRNA
      3 non_coding
...
</pre>

Full output for release 83 is:

```sh
Downloading cDNA
Downloading ncRNA
Downloading GTF
Creating transcripts file
Number of transcripts in transcripts file:
213853 transcript_ids_from_fasta
Number of transcripts in GTF file:
199184 transcript_ids_from_gtf
Transcripts in FASTA but not in GTF:
18044 ufasta.txt
Transcripts in GTF but not in FASTA:
3375 ugtf.txt
The transcripts unique to the FASTA file are from:
CHR_HG126_PATCH
CHR_HG1342_HG2282_PATCH
CHR_HG1362_PATCH
CHR_HG142_HG150_NOVEL_TEST
CHR_HG151_NOVEL_TEST
CHR_HG1651_PATCH
CHR_HG1832_PATCH
CHR_HG2021_PATCH
CHR_HG2030_PATCH
CHR_HG2058_PATCH
CHR_HG2062_PATCH
CHR_HG2066_PATCH
CHR_HG2072_PATCH
CHR_HG2095_PATCH
CHR_HG2104_PATCH
CHR_HG2116_PATCH
CHR_HG2128_PATCH
CHR_HG2191_PATCH
CHR_HG2213_PATCH
CHR_HG2217_PATCH
CHR_HG2232_PATCH
CHR_HG2233_PATCH
CHR_HG2235_PATCH
CHR_HG2239_PATCH
CHR_HG2247_PATCH
CHR_HG2249_PATCH
CHR_HG2288_HG2289_PATCH
CHR_HG2290_PATCH
CHR_HG2291_PATCH
CHR_HG2334_PATCH
CHR_HG23_PATCH
CHR_HG26_PATCH
CHR_HG986_PATCH
CHR_HSCHR10_1_CTG1
CHR_HSCHR10_1_CTG2
CHR_HSCHR10_1_CTG3
CHR_HSCHR10_1_CTG4
CHR_HSCHR10_1_CTG6
CHR_HSCHR11_1_CTG1_2
CHR_HSCHR11_1_CTG5
CHR_HSCHR11_1_CTG6
CHR_HSCHR11_1_CTG7
CHR_HSCHR11_1_CTG8
CHR_HSCHR11_2_CTG1
CHR_HSCHR11_2_CTG1_1
CHR_HSCHR11_3_CTG1
CHR_HSCHR1_1_CTG11
CHR_HSCHR1_1_CTG3
CHR_HSCHR1_1_CTG31
CHR_HSCHR1_1_CTG32_1
CHR_HSCHR12_1_CTG1
CHR_HSCHR12_1_CTG2_1
CHR_HSCHR12_2_CTG1
CHR_HSCHR12_2_CTG2
CHR_HSCHR12_2_CTG2_1
CHR_HSCHR12_3_CTG2
CHR_HSCHR12_3_CTG2_1
CHR_HSCHR12_4_CTG2
CHR_HSCHR12_4_CTG2_1
CHR_HSCHR12_5_CTG2
CHR_HSCHR12_5_CTG2_1
CHR_HSCHR12_6_CTG2_1
CHR_HSCHR1_2_CTG3
CHR_HSCHR1_2_CTG31
CHR_HSCHR1_2_CTG32_1
CHR_HSCHR13_1_CTG1
CHR_HSCHR13_1_CTG3
CHR_HSCHR13_1_CTG5
CHR_HSCHR13_1_CTG7
CHR_HSCHR13_1_CTG8
CHR_HSCHR1_3_CTG3
CHR_HSCHR1_3_CTG31
CHR_HSCHR1_3_CTG32_1
CHR_HSCHR14_1_CTG1
CHR_HSCHR14_2_CTG1
CHR_HSCHR14_3_CTG1
CHR_HSCHR14_7_CTG1
CHR_HSCHR1_4_CTG3
CHR_HSCHR1_4_CTG31
CHR_HSCHR15_1_CTG1
CHR_HSCHR15_1_CTG3
CHR_HSCHR15_1_CTG8
CHR_HSCHR15_2_CTG3
CHR_HSCHR15_2_CTG8
CHR_HSCHR15_3_CTG3
CHR_HSCHR15_3_CTG8
CHR_HSCHR15_4_CTG8
CHR_HSCHR15_5_CTG8
CHR_HSCHR15_6_CTG8
CHR_HSCHR1_5_CTG32_1
CHR_HSCHR16_1_CTG1
CHR_HSCHR16_1_CTG3_1
CHR_HSCHR16_2_CTG3_1
CHR_HSCHR16_3_CTG1
CHR_HSCHR16_4_CTG1
CHR_HSCHR16_4_CTG3_1
CHR_HSCHR16_5_CTG1
CHR_HSCHR16_CTG2
CHR_HSCHR17_10_CTG4
CHR_HSCHR17_1_CTG1
CHR_HSCHR17_1_CTG2
CHR_HSCHR17_1_CTG4
CHR_HSCHR17_1_CTG5
CHR_HSCHR17_1_CTG9
CHR_HSCHR17_2_CTG1
CHR_HSCHR17_2_CTG2
CHR_HSCHR17_2_CTG4
CHR_HSCHR17_2_CTG5
CHR_HSCHR17_3_CTG2
CHR_HSCHR17_3_CTG4
CHR_HSCHR17_4_CTG4
CHR_HSCHR17_5_CTG4
CHR_HSCHR17_6_CTG4
CHR_HSCHR17_7_CTG4
CHR_HSCHR17_8_CTG4
CHR_HSCHR17_9_CTG4
CHR_HSCHR18_1_CTG1_1
CHR_HSCHR18_1_CTG2_1
CHR_HSCHR18_2_CTG1_1
CHR_HSCHR18_2_CTG2
CHR_HSCHR18_2_CTG2_1
CHR_HSCHR18_3_CTG2_1
CHR_HSCHR18_5_CTG1_1
CHR_HSCHR18_ALT21_CTG2_1
CHR_HSCHR18_ALT2_CTG2_1
CHR_HSCHR19_1_CTG2
CHR_HSCHR19_1_CTG3_1
CHR_HSCHR19_2_CTG2
CHR_HSCHR19_2_CTG3_1
CHR_HSCHR19_3_CTG2
CHR_HSCHR19_3_CTG3_1
CHR_HSCHR19_4_CTG2
CHR_HSCHR19_4_CTG3_1
CHR_HSCHR19_5_CTG2
CHR_HSCHR19KIR_ABC08_A1_HAP_CTG3_1
CHR_HSCHR19KIR_ABC08_AB_HAP_C_P_CTG3_1
CHR_HSCHR19KIR_ABC08_AB_HAP_T_P_CTG3_1
CHR_HSCHR19KIR_FH05_A_HAP_CTG3_1
CHR_HSCHR19KIR_FH05_B_HAP_CTG3_1
CHR_HSCHR19KIR_FH06_A_HAP_CTG3_1
CHR_HSCHR19KIR_FH06_BA1_HAP_CTG3_1
CHR_HSCHR19KIR_FH08_A_HAP_CTG3_1
CHR_HSCHR19KIR_FH08_BAX_HAP_CTG3_1
CHR_HSCHR19KIR_FH13_A_HAP_CTG3_1
CHR_HSCHR19KIR_FH13_BA2_HAP_CTG3_1
CHR_HSCHR19KIR_FH15_A_HAP_CTG3_1
CHR_HSCHR19KIR_FH15_B_HAP_CTG3_1
CHR_HSCHR19KIR_G085_A_HAP_CTG3_1
CHR_HSCHR19KIR_G085_BA1_HAP_CTG3_1
CHR_HSCHR19KIR_G248_A_HAP_CTG3_1
CHR_HSCHR19KIR_G248_BA2_HAP_CTG3_1
CHR_HSCHR19KIR_GRC212_AB_HAP_CTG3_1
CHR_HSCHR19KIR_GRC212_BA1_HAP_CTG3_1
CHR_HSCHR19KIR_LUCE_A_HAP_CTG3_1
CHR_HSCHR19KIR_LUCE_BDEL_HAP_CTG3_1
CHR_HSCHR19KIR_RP5_B_HAP_CTG3_1
CHR_HSCHR19KIR_RSH_A_HAP_CTG3_1
CHR_HSCHR19KIR_RSH_BA2_HAP_CTG3_1
CHR_HSCHR19KIR_T7526_A_HAP_CTG3_1
CHR_HSCHR19KIR_T7526_BDEL_HAP_CTG3_1
CHR_HSCHR19LRC_COX1_CTG3_1
CHR_HSCHR19LRC_COX2_CTG3_1
CHR_HSCHR19LRC_LRC_I_CTG3_1
CHR_HSCHR19LRC_LRC_J_CTG3_1
CHR_HSCHR19LRC_LRC_S_CTG3_1
CHR_HSCHR19LRC_LRC_T_CTG3_1
CHR_HSCHR19LRC_PGF1_CTG3_1
CHR_HSCHR19LRC_PGF2_CTG3_1
CHR_HSCHR1_ALT2_1_CTG32_1
CHR_HSCHR20_1_CTG1
CHR_HSCHR20_1_CTG2
CHR_HSCHR20_1_CTG3
CHR_HSCHR20_1_CTG4
CHR_HSCHR21_2_CTG1_1
CHR_HSCHR21_3_CTG1_1
CHR_HSCHR21_4_CTG1_1
CHR_HSCHR21_5_CTG2
CHR_HSCHR21_6_CTG1_1
CHR_HSCHR21_8_CTG1_1
CHR_HSCHR2_1_CTG1
CHR_HSCHR2_1_CTG15
CHR_HSCHR2_1_CTG5
CHR_HSCHR2_1_CTG7
CHR_HSCHR2_1_CTG7_2
CHR_HSCHR22_1_CTG1
CHR_HSCHR22_1_CTG2
CHR_HSCHR22_1_CTG3
CHR_HSCHR22_1_CTG4
CHR_HSCHR22_1_CTG5
CHR_HSCHR22_1_CTG6
CHR_HSCHR22_1_CTG7
CHR_HSCHR22_2_CTG1
CHR_HSCHR22_3_CTG1
CHR_HSCHR22_4_CTG1
CHR_HSCHR22_5_CTG1
CHR_HSCHR22_6_CTG1
CHR_HSCHR22_7_CTG1
CHR_HSCHR2_2_CTG1
CHR_HSCHR2_2_CTG15
CHR_HSCHR2_2_CTG7
CHR_HSCHR2_2_CTG7_2
CHR_HSCHR2_3_CTG1
CHR_HSCHR2_3_CTG15
CHR_HSCHR2_3_CTG7_2
CHR_HSCHR2_4_CTG1
CHR_HSCHR3_1_CTG1
CHR_HSCHR3_1_CTG2_1
CHR_HSCHR3_1_CTG3
CHR_HSCHR3_2_CTG2_1
CHR_HSCHR3_2_CTG3
CHR_HSCHR3_3_CTG1
CHR_HSCHR3_3_CTG3
CHR_HSCHR3_4_CTG2_1
CHR_HSCHR3_4_CTG3
CHR_HSCHR3_5_CTG2_1
CHR_HSCHR3_5_CTG3
CHR_HSCHR3_6_CTG3
CHR_HSCHR3_7_CTG3
CHR_HSCHR3_8_CTG3
CHR_HSCHR3_9_CTG3
CHR_HSCHR4_1_CTG12
CHR_HSCHR4_1_CTG4
CHR_HSCHR4_1_CTG6
CHR_HSCHR4_1_CTG9
CHR_HSCHR4_2_CTG12
CHR_HSCHR4_2_CTG4
CHR_HSCHR4_3_CTG12
CHR_HSCHR4_4_CTG12
CHR_HSCHR4_5_CTG12
CHR_HSCHR4_6_CTG12
CHR_HSCHR4_7_CTG12
CHR_HSCHR4_8_CTG12
CHR_HSCHR4_9_CTG12
CHR_HSCHR5_1_CTG1
CHR_HSCHR5_1_CTG1_1
CHR_HSCHR5_1_CTG5
CHR_HSCHR5_2_CTG1
CHR_HSCHR5_2_CTG1_1
CHR_HSCHR5_2_CTG5
CHR_HSCHR5_3_CTG1
CHR_HSCHR5_3_CTG5
CHR_HSCHR5_4_CTG1
CHR_HSCHR5_4_CTG1_1
CHR_HSCHR5_5_CTG1
CHR_HSCHR5_6_CTG1
CHR_HSCHR5_7_CTG1
CHR_HSCHR6_1_CTG10
CHR_HSCHR6_1_CTG2
CHR_HSCHR6_1_CTG4
CHR_HSCHR6_1_CTG5
CHR_HSCHR6_1_CTG6
CHR_HSCHR6_1_CTG7
CHR_HSCHR6_1_CTG8
CHR_HSCHR6_1_CTG9
CHR_HSCHR6_8_CTG1
CHR_HSCHR6_MHC_APD_CTG1
CHR_HSCHR6_MHC_COX_CTG1
CHR_HSCHR6_MHC_DBB_CTG1
CHR_HSCHR6_MHC_MANN_CTG1
CHR_HSCHR6_MHC_MCF_CTG1
CHR_HSCHR6_MHC_QBL_CTG1
CHR_HSCHR6_MHC_SSTO_CTG1
CHR_HSCHR7_1_CTG1
CHR_HSCHR7_1_CTG4_4
CHR_HSCHR7_1_CTG6
CHR_HSCHR7_1_CTG7
CHR_HSCHR7_2_CTG1
CHR_HSCHR7_2_CTG4_4
CHR_HSCHR7_2_CTG6
CHR_HSCHR7_2_CTG7
CHR_HSCHR7_3_CTG6
CHR_HSCHR8_1_CTG1
CHR_HSCHR8_1_CTG6
CHR_HSCHR8_1_CTG7
CHR_HSCHR8_2_CTG1
CHR_HSCHR8_2_CTG7
CHR_HSCHR8_3_CTG1
CHR_HSCHR8_3_CTG7
CHR_HSCHR8_4_CTG1
CHR_HSCHR8_4_CTG7
CHR_HSCHR8_5_CTG1
CHR_HSCHR8_5_CTG7
CHR_HSCHR8_6_CTG1
CHR_HSCHR8_7_CTG1
CHR_HSCHR8_8_CTG1
CHR_HSCHR8_9_CTG1
CHR_HSCHR9_1_CTG1
CHR_HSCHR9_1_CTG2
CHR_HSCHR9_1_CTG3
CHR_HSCHR9_1_CTG4
CHR_HSCHR9_1_CTG5
CHR_HSCHR9_1_CTG6
CHR_HSCHRX_1_CTG3
CHR_HSCHRX_2_CTG12
CHR_HSCHRX_2_CTG3
The transcripts unique to the GTF file are of type:
   2306 misc_RNA
   1069 TEC
The transcripts NOT unique to the GTF file are of type:
     32 3prime_overlapping_ncrna
  10183 antisense
      5 bidirectional_promoter_lncrna
     19 IG_C_gene
      9 IG_C_pseudogene
     37 IG_D_gene
     18 IG_J_gene
      3 IG_J_pseudogene
    158 IG_V_gene
    183 IG_V_pseudogene
  12648 lincRNA
      1 macro_lncRNA
   4198 miRNA
      2 Mt_rRNA
     22 Mt_tRNA
      3 non_coding
    152 polymorphic_pseudogene
  10280 processed_pseudogene
   2760 processed_transcript
 143876 protein_coding
     25 pseudogene
      8 ribozyme
    549 rRNA
     49 scaRNA
    978 sense_intronic
    334 sense_overlapping
    961 snoRNA
   1905 snRNA
     20 sRNA
    922 transcribed_processed_pseudogene
     11 transcribed_unitary_pseudogene
   2191 transcribed_unprocessed_pseudogene
      1 translated_unprocessed_pseudogene
      9 TR_C_gene
      4 TR_D_gene
     79 TR_J_gene
      4 TR_J_pseudogene
    110 TR_V_gene
     30 TR_V_pseudogene
    418 unitary_pseudogene
   2611 unprocessed_pseudogene
      1 vaultRNA
```

Full output for release 86 is

```sh
Downloading cDNA
Downloading ncRNA
Downloading GTF
Creating transcripts file
Number of transcripts in transcripts file:
214837 transcript_ids_from_fasta
Number of transcripts in GTF file:
198002 transcript_ids_from_gtf
Transcripts in FASTA but not in GTF:
17901 ufasta.txt
Transcripts in GTF but not in FASTA:
1066 ugtf.txt
The transcripts unique to the FASTA file are from:
CHR_HG107_PATCH
CHR_HG126_PATCH
CHR_HG1311_PATCH
CHR_HG1342_HG2282_PATCH
CHR_HG1362_PATCH
CHR_HG142_HG150_NOVEL_TEST
CHR_HG151_NOVEL_TEST
CHR_HG1651_PATCH
CHR_HG1832_PATCH
CHR_HG2021_PATCH
CHR_HG2022_PATCH
CHR_HG2023_PATCH
CHR_HG2030_PATCH
CHR_HG2058_PATCH
CHR_HG2062_PATCH
CHR_HG2063_PATCH
CHR_HG2066_PATCH
CHR_HG2072_PATCH
CHR_HG2095_PATCH
CHR_HG2104_PATCH
CHR_HG2116_PATCH
CHR_HG2128_PATCH
CHR_HG2191_PATCH
CHR_HG2213_PATCH
CHR_HG2217_PATCH
CHR_HG2232_PATCH
CHR_HG2233_PATCH
CHR_HG2235_PATCH
CHR_HG2239_PATCH
CHR_HG2247_PATCH
CHR_HG2249_PATCH
CHR_HG2288_HG2289_PATCH
CHR_HG2290_PATCH
CHR_HG2291_PATCH
CHR_HG2334_PATCH
CHR_HG26_PATCH
CHR_HG986_PATCH
CHR_HSCHR10_1_CTG1
CHR_HSCHR10_1_CTG2
CHR_HSCHR10_1_CTG3
CHR_HSCHR10_1_CTG4
CHR_HSCHR10_1_CTG6
CHR_HSCHR11_1_CTG1_2
CHR_HSCHR11_1_CTG5
CHR_HSCHR11_1_CTG6
CHR_HSCHR11_1_CTG7
CHR_HSCHR11_1_CTG8
CHR_HSCHR11_2_CTG1
CHR_HSCHR11_2_CTG1_1
CHR_HSCHR11_3_CTG1
CHR_HSCHR1_1_CTG11
CHR_HSCHR1_1_CTG3
CHR_HSCHR1_1_CTG31
CHR_HSCHR1_1_CTG32_1
CHR_HSCHR12_1_CTG1
CHR_HSCHR12_1_CTG2_1
CHR_HSCHR12_2_CTG1
CHR_HSCHR12_2_CTG2
CHR_HSCHR12_2_CTG2_1
CHR_HSCHR12_3_CTG2
CHR_HSCHR12_3_CTG2_1
CHR_HSCHR12_4_CTG2
CHR_HSCHR12_4_CTG2_1
CHR_HSCHR12_5_CTG2
CHR_HSCHR12_5_CTG2_1
CHR_HSCHR12_6_CTG2_1
CHR_HSCHR1_2_CTG3
CHR_HSCHR1_2_CTG31
CHR_HSCHR1_2_CTG32_1
CHR_HSCHR13_1_CTG1
CHR_HSCHR13_1_CTG3
CHR_HSCHR13_1_CTG5
CHR_HSCHR13_1_CTG8
CHR_HSCHR1_3_CTG3
CHR_HSCHR1_3_CTG31
CHR_HSCHR1_3_CTG32_1
CHR_HSCHR14_1_CTG1
CHR_HSCHR14_2_CTG1
CHR_HSCHR14_3_CTG1
CHR_HSCHR14_7_CTG1
CHR_HSCHR1_4_CTG3
CHR_HSCHR1_4_CTG31
CHR_HSCHR15_1_CTG1
CHR_HSCHR15_1_CTG3
CHR_HSCHR15_1_CTG8
CHR_HSCHR15_2_CTG3
CHR_HSCHR15_2_CTG8
CHR_HSCHR15_3_CTG3
CHR_HSCHR15_3_CTG8
CHR_HSCHR15_4_CTG8
CHR_HSCHR15_5_CTG8
CHR_HSCHR15_6_CTG8
CHR_HSCHR1_5_CTG3
CHR_HSCHR1_5_CTG32_1
CHR_HSCHR16_1_CTG1
CHR_HSCHR16_1_CTG3_1
CHR_HSCHR16_2_CTG3_1
CHR_HSCHR16_3_CTG1
CHR_HSCHR16_4_CTG1
CHR_HSCHR16_4_CTG3_1
CHR_HSCHR16_5_CTG1
CHR_HSCHR16_CTG2
CHR_HSCHR17_10_CTG4
CHR_HSCHR17_1_CTG1
CHR_HSCHR17_1_CTG2
CHR_HSCHR17_1_CTG4
CHR_HSCHR17_1_CTG5
CHR_HSCHR17_1_CTG9
CHR_HSCHR17_2_CTG1
CHR_HSCHR17_2_CTG2
CHR_HSCHR17_2_CTG4
CHR_HSCHR17_2_CTG5
CHR_HSCHR17_3_CTG2
CHR_HSCHR17_3_CTG4
CHR_HSCHR17_4_CTG4
CHR_HSCHR17_5_CTG4
CHR_HSCHR17_6_CTG4
CHR_HSCHR17_7_CTG4
CHR_HSCHR17_8_CTG4
CHR_HSCHR17_9_CTG4
CHR_HSCHR18_1_CTG1_1
CHR_HSCHR18_1_CTG2_1
CHR_HSCHR18_2_CTG1_1
CHR_HSCHR18_2_CTG2
CHR_HSCHR18_2_CTG2_1
CHR_HSCHR18_3_CTG2_1
CHR_HSCHR18_5_CTG1_1
CHR_HSCHR18_ALT21_CTG2_1
CHR_HSCHR18_ALT2_CTG2_1
CHR_HSCHR19_1_CTG2
CHR_HSCHR19_1_CTG3_1
CHR_HSCHR19_2_CTG2
CHR_HSCHR19_2_CTG3_1
CHR_HSCHR19_3_CTG2
CHR_HSCHR19_3_CTG3_1
CHR_HSCHR19_4_CTG2
CHR_HSCHR19_4_CTG3_1
CHR_HSCHR19_5_CTG2
CHR_HSCHR19KIR_ABC08_A1_HAP_CTG3_1
CHR_HSCHR19KIR_ABC08_AB_HAP_C_P_CTG3_1
CHR_HSCHR19KIR_ABC08_AB_HAP_T_P_CTG3_1
CHR_HSCHR19KIR_FH05_A_HAP_CTG3_1
CHR_HSCHR19KIR_FH05_B_HAP_CTG3_1
CHR_HSCHR19KIR_FH06_A_HAP_CTG3_1
CHR_HSCHR19KIR_FH06_BA1_HAP_CTG3_1
CHR_HSCHR19KIR_FH08_A_HAP_CTG3_1
CHR_HSCHR19KIR_FH08_BAX_HAP_CTG3_1
CHR_HSCHR19KIR_FH13_A_HAP_CTG3_1
CHR_HSCHR19KIR_FH13_BA2_HAP_CTG3_1
CHR_HSCHR19KIR_FH15_A_HAP_CTG3_1
CHR_HSCHR19KIR_FH15_B_HAP_CTG3_1
CHR_HSCHR19KIR_G085_A_HAP_CTG3_1
CHR_HSCHR19KIR_G085_BA1_HAP_CTG3_1
CHR_HSCHR19KIR_G248_A_HAP_CTG3_1
CHR_HSCHR19KIR_G248_BA2_HAP_CTG3_1
CHR_HSCHR19KIR_GRC212_AB_HAP_CTG3_1
CHR_HSCHR19KIR_GRC212_BA1_HAP_CTG3_1
CHR_HSCHR19KIR_LUCE_A_HAP_CTG3_1
CHR_HSCHR19KIR_LUCE_BDEL_HAP_CTG3_1
CHR_HSCHR19KIR_RP5_B_HAP_CTG3_1
CHR_HSCHR19KIR_RSH_A_HAP_CTG3_1
CHR_HSCHR19KIR_RSH_BA2_HAP_CTG3_1
CHR_HSCHR19KIR_T7526_A_HAP_CTG3_1
CHR_HSCHR19KIR_T7526_BDEL_HAP_CTG3_1
CHR_HSCHR19LRC_COX1_CTG3_1
CHR_HSCHR19LRC_COX2_CTG3_1
CHR_HSCHR19LRC_LRC_I_CTG3_1
CHR_HSCHR19LRC_LRC_J_CTG3_1
CHR_HSCHR19LRC_LRC_S_CTG3_1
CHR_HSCHR19LRC_LRC_T_CTG3_1
CHR_HSCHR19LRC_PGF1_CTG3_1
CHR_HSCHR19LRC_PGF2_CTG3_1
CHR_HSCHR1_ALT2_1_CTG32_1
CHR_HSCHR20_1_CTG1
CHR_HSCHR20_1_CTG2
CHR_HSCHR20_1_CTG3
CHR_HSCHR20_1_CTG4
CHR_HSCHR21_2_CTG1_1
CHR_HSCHR21_3_CTG1_1
CHR_HSCHR21_4_CTG1_1
CHR_HSCHR21_5_CTG2
CHR_HSCHR21_6_CTG1_1
CHR_HSCHR21_8_CTG1_1
CHR_HSCHR2_1_CTG1
CHR_HSCHR2_1_CTG15
CHR_HSCHR2_1_CTG5
CHR_HSCHR2_1_CTG7
CHR_HSCHR2_1_CTG7_2
CHR_HSCHR22_1_CTG1
CHR_HSCHR22_1_CTG2
CHR_HSCHR22_1_CTG3
CHR_HSCHR22_1_CTG4
CHR_HSCHR22_1_CTG5
CHR_HSCHR22_1_CTG6
CHR_HSCHR22_1_CTG7
CHR_HSCHR22_2_CTG1
CHR_HSCHR22_3_CTG1
CHR_HSCHR22_4_CTG1
CHR_HSCHR22_5_CTG1
CHR_HSCHR22_6_CTG1
CHR_HSCHR22_7_CTG1
CHR_HSCHR22_8_CTG1
CHR_HSCHR2_2_CTG1
CHR_HSCHR2_2_CTG15
CHR_HSCHR2_2_CTG7
CHR_HSCHR2_2_CTG7_2
CHR_HSCHR2_3_CTG1
CHR_HSCHR2_3_CTG15
CHR_HSCHR2_3_CTG7_2
CHR_HSCHR2_4_CTG1
CHR_HSCHR2_6_CTG7_2
CHR_HSCHR3_1_CTG1
CHR_HSCHR3_1_CTG2_1
CHR_HSCHR3_1_CTG3
CHR_HSCHR3_2_CTG2_1
CHR_HSCHR3_2_CTG3
CHR_HSCHR3_3_CTG1
CHR_HSCHR3_3_CTG3
CHR_HSCHR3_4_CTG2_1
CHR_HSCHR3_4_CTG3
CHR_HSCHR3_5_CTG2_1
CHR_HSCHR3_5_CTG3
CHR_HSCHR3_6_CTG3
CHR_HSCHR3_7_CTG3
CHR_HSCHR3_8_CTG3
CHR_HSCHR3_9_CTG3
CHR_HSCHR4_11_CTG12
CHR_HSCHR4_1_CTG12
CHR_HSCHR4_1_CTG4
CHR_HSCHR4_1_CTG6
CHR_HSCHR4_1_CTG9
CHR_HSCHR4_2_CTG12
CHR_HSCHR4_2_CTG4
CHR_HSCHR4_3_CTG12
CHR_HSCHR4_4_CTG12
CHR_HSCHR4_5_CTG12
CHR_HSCHR4_6_CTG12
CHR_HSCHR4_7_CTG12
CHR_HSCHR4_8_CTG12
CHR_HSCHR4_9_CTG12
CHR_HSCHR5_1_CTG1
CHR_HSCHR5_1_CTG1_1
CHR_HSCHR5_1_CTG5
CHR_HSCHR5_2_CTG1
CHR_HSCHR5_2_CTG1_1
CHR_HSCHR5_2_CTG5
CHR_HSCHR5_3_CTG1
CHR_HSCHR5_3_CTG5
CHR_HSCHR5_4_CTG1
CHR_HSCHR5_4_CTG1_1
CHR_HSCHR5_5_CTG1
CHR_HSCHR5_6_CTG1
CHR_HSCHR5_7_CTG1
CHR_HSCHR6_1_CTG10
CHR_HSCHR6_1_CTG2
CHR_HSCHR6_1_CTG4
CHR_HSCHR6_1_CTG5
CHR_HSCHR6_1_CTG6
CHR_HSCHR6_1_CTG7
CHR_HSCHR6_1_CTG8
CHR_HSCHR6_1_CTG9
CHR_HSCHR6_8_CTG1
CHR_HSCHR6_MHC_APD_CTG1
CHR_HSCHR6_MHC_COX_CTG1
CHR_HSCHR6_MHC_DBB_CTG1
CHR_HSCHR6_MHC_MANN_CTG1
CHR_HSCHR6_MHC_MCF_CTG1
CHR_HSCHR6_MHC_QBL_CTG1
CHR_HSCHR6_MHC_SSTO_CTG1
CHR_HSCHR7_1_CTG1
CHR_HSCHR7_1_CTG4_4
CHR_HSCHR7_1_CTG6
CHR_HSCHR7_1_CTG7
CHR_HSCHR7_2_CTG1
CHR_HSCHR7_2_CTG4_4
CHR_HSCHR7_2_CTG6
CHR_HSCHR7_2_CTG7
CHR_HSCHR7_3_CTG6
CHR_HSCHR8_1_CTG1
CHR_HSCHR8_1_CTG6
CHR_HSCHR8_1_CTG7
CHR_HSCHR8_2_CTG1
CHR_HSCHR8_2_CTG7
CHR_HSCHR8_3_CTG1
CHR_HSCHR8_3_CTG7
CHR_HSCHR8_4_CTG1
CHR_HSCHR8_4_CTG7
CHR_HSCHR8_5_CTG1
CHR_HSCHR8_5_CTG7
CHR_HSCHR8_6_CTG1
CHR_HSCHR8_7_CTG1
CHR_HSCHR8_8_CTG1
CHR_HSCHR8_9_CTG1
CHR_HSCHR9_1_CTG1
CHR_HSCHR9_1_CTG2
CHR_HSCHR9_1_CTG3
CHR_HSCHR9_1_CTG4
CHR_HSCHR9_1_CTG5
CHR_HSCHR9_1_CTG6
CHR_HSCHRX_1_CTG3
CHR_HSCHRX_2_CTG12
CHR_HSCHRX_2_CTG3
The transcripts unique to the GTF file are of type:
   1066 TEC
The transcripts NOT unique to the GTF file are of type:
     34 3prime_overlapping_ncRNA
  10038 antisense
      8 bidirectional_promoter_lncRNA
     18 IG_C_gene
      9 IG_C_pseudogene
     37 IG_D_gene
     18 IG_J_gene
      3 IG_J_pseudogene
      1 IG_pseudogene
    154 IG_V_gene
    193 IG_V_pseudogene
  12440 lincRNA
      1 macro_lncRNA
   1567 miRNA
   2221 misc_RNA
      2 Mt_rRNA
     22 Mt_tRNA
      3 non_coding
    116 polymorphic_pseudogene
  10272 processed_pseudogene
   2814 processed_transcript
 145385 protein_coding
     25 pseudogene
      8 ribozyme
    549 rRNA
     49 scaRNA
      1 scRNA
    969 sense_intronic
    301 sense_overlapping
    956 snoRNA
   1909 snRNA
      5 sRNA
    943 transcribed_processed_pseudogene
    283 transcribed_unitary_pseudogene
   2395 transcribed_unprocessed_pseudogene
     14 TR_C_gene
      4 TR_D_gene
     79 TR_J_gene
      4 TR_J_pseudogene
    109 TR_V_gene
     30 TR_V_pseudogene
    284 unitary_pseudogene
   2662 unprocessed_pseudogene
      1 vaultRNA
```





