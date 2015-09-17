stat_file <- "SCEB-Transrate-statistics.tsv"

library(plyr)
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(Biostrings))

tStats <- read.delim(file = stat_file, blank.lines.skip = TRUE, skip = 44, header = TRUE) # First 44 lines not necessary, 45th line is header, blank.lines.skip includes all lines that aren't blank (including comments lines)

names(tStats)[names(tStats) == 'X..Name'] <- 'name' ## First column is read in as "X..Name", here I convert it to just name for simplicity

good_scaffolds_list <- tStats %>% 
  select(name, quality) %>% 
  filter(quality == "good") %>% 
  select(name)

sequences <- readDNAStringSet(filepath = "SCEB-SOAPdenovo-Trans-assembly.fa")
