## Load packages
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(Biostrings))

## List filenames
transcriptome_file <- "SCEB-SOAPdenovo-Trans-assembly.fa"
transratestats_file <- "SCEB-Transrate-statistics.tsv"

## Read in a single species transcriptome data
Tdat <- readDNAStringSet(filepath = transcriptome_file)

## ead in transrate stats data
TRSdat <- read.delim(file = transratestats_file, stringsAsFactors = FALSE, 
                    skip = 44) # First 44 lines are a summary of the data
names(TRSdat)[1] <- 'names' # Simplify 1st column name

## Produce a list of names of good quality scaffolds
good_scaffolds_names <- TRSdat %>% filter(quality == "good") %>%
  select(names) %>% unlist

## Produce a vector that indexes the quality of each scaffold
scaffolds_index <- names(Tdat) %in% good_scaffolds_names

## Removes all bad scaffolds
Cdat <- Tdat[scaffolds_index]

