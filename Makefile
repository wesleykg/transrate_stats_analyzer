all: $(patsubst %-SOAPdenovo-Trans-assembly.fa, %-Transrate-statistics.tsv, $(wildcard *-SOAPdenovo-Trans-assembly.fa)) *-cleaned.fasta

clean: 
	rm -f *-cleaned.fasta

%-cleaned.fasta: %-SOAPdenovo-Trans-assembly.fa %-Transrate-statistics.tsv
	Rscript trs_cleaner.R $^

.PHONY: all clean
.DELETE_ON_ERROR:
.SECONDARY: