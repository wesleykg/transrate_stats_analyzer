tsStats_file <- "SCEB-Transrate-statistics.tsv"

library(dplyr)
library(Biostrings)

tsDat <- read.delim(file = tsStats_file, stringsAsFactors = FALSE, 
                    skip = 44) # First 44 lines are a summary of the data

names(tsDat)[1] <- 'name' # Simplify 1st column name

good_scaffolds <- tsDat %>% filter(quality == "good") %>% select(name) %>% unlist

SCEBdat <- readDNAStringSet(filepath = "SCEB-SOAPdenovo-Trans-assembly.fa")


