suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(Biostrings))

transcriptome_file <- "SCEB-SOAPdenovo-Trans-assembly.fa"
transratestats_file <- "SCEB-Transrate-statistics.tsv"

Tdat <- readDNAStringSet(filepath = transcriptome_file)
# all_scaffolds <- names(Tdat)

TRSdat <- read.delim(file = transratestats_file, stringsAsFactors = FALSE, 
                    skip = 44) # First 44 lines are a summary of the data
names(TRSdat)[1] <- 'name' # Simplify 1st column name
good_scaffolds <- TRSdat %>% filter(quality == "good") %>% select(name) %>%
  unlist

Cleandat <- subset(Tdat, name = good_scaffolds, select = name)
identical(Cleandat, Tdat)
