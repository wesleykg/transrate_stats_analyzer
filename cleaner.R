## Load packages
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(Biostrings))
library(docopt)

## List filenames
transcriptome_file <- "SCEB-SOAPdenovo-Trans-assembly.fa"
transratestats_file <- "SCEB-Transrate-statistics.tsv"
clean_transcriptome_out <- "SCEB-cleaned.fa"

## Read in a single species Transcriptome (T) data
Tdat <- readDNAStringSet(filepath = transcriptome_file)

## Read in Transrate Stats (TRS) data
TRSdat <- read.delim(file = transratestats_file, stringsAsFactors = FALSE, 
                    skip = 44) # First 44 lines are a summary of the data
names(TRSdat)[1] <- 'names' # Simplify 1st column name

## Produce a list of names of good quality scaffolds
good_scaffolds_names <- TRSdat %>% filter(quality == "good") %>%
  select(names) %>% unlist

## Produce a vector that is an index of scaffold quality
scaffolds_index <- names(Tdat) %in% good_scaffolds_names

## Retain all good scaffolds; discard bad scaffolds
Cdat <- Tdat[scaffolds_index]

## Write good scaffolds to file:
writeXStringSet(Cdat, transcriptome_out)
