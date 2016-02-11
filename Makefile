all: SCEB-cleaned.fasta

clean: 
	rm -f SCEB-cleaned.fasta

SCEB-cleaned.fasta: SCEB-SOAPdenovo-Trans-assembly.fa SCEB-Transrate-statistics.tsv
	Rscript cleaner.R $^

.PHONY: all clean
.DELETE_ON_ERROR:
.SECONDARY: