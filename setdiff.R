#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly = TRUE)

one <- read.table(args[1], stringsAsFactors=FALSE)[,1]
two <- read.table(args[2], stringsAsFactors=FALSE)[,1]

sd <- setdiff(one, two)

cat(sd, file="", sep="\n")

