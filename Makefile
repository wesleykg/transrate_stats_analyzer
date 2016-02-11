all: $(patsubst %-SOAPdenovo-Trans-assembly.fa, %-cleaned.fasta, $(wildcard *-SOAPdenovo-Trans-assembly.fa))

clean: 
	rm -f *-cleaned.fasta

%-cleaned.fasta: %-SOAPdenovo-Trans-assembly.fa %-SOAPdenovo-Trans-Transrate-stats.tsv
	Rscript trs_cleaner.R $^

.PHONY: all clean
.DELETE_ON_ERROR:
.SECONDARY: