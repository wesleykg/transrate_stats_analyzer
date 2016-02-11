all: SCEB-cleaned.fa

clean: 
	rm -f SCEB-cleaned.fa

SCEB-cleaned.fa: SCEB-SOAPdenovo-Trans-assembly.fa SCEB-Transrate-statistics.tsv
	Rscript cleaner.R $^

.PHONY: all clean
.DELETE_ON_ERROR:
.SECONDARY: