##Load packages
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(Biostrings))

##List filenames
transcriptome_file <- "SCEB-SOAPdenovo-Trans-assembly.fa"
transratestats_file <- "SCEB-Transrate-statistics.tsv"

##Read in a single species transcriptome data
Tdat <- readDNAStringSet(filepath = transcriptome_file)

##Read in transrate stats data
TRSdat <- read.delim(file = transratestats_file, stringsAsFactors = FALSE, 
                    skip = 44) # First 44 lines are a summary of the data
names(TRSdat)[1] <- 'names' # Simplify 1st column name

##Produce a list of scaffold names that have good quality
good_scaffolds_names <- TRSdat %>% filter(quality == "good") %>%
  select(names) %>% unlist

##Create a DNAStringSet object with just good scaffold names
good_scaffolds = NULL
for (i in 1:length(good_scaffolds_names))
  good_scaffolds = c(good_scaffolds, paste0("ATCG"))
good_scaffolds <- DNAStringSet(good_scaffolds)
names(good_scaffolds)[1:length(good_scaffolds_names)] <- good_scaffolds_names
str(good_scaffolds)

##Stuck here
Cdat <- subset(Tdat, subset = good_scaffolds)
