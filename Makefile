fna: $(patsubst %.fna, %-cleaned.fasta, $(wildcard *.fna))

faa: $(patsubst %.faa, %-cleaned.fasta, $(wildcard *.faa))

%-cleaned.fasta: %.fna JZVE-SOAPdenovo-Trans-Transrate-stats.tsv
	Rscript trs_cleaner.R $^
	
%-cleaned.fasta: %.faa JZVE-SOAPdenovo-Trans-Transrate-stats.tsv
	Rscript trs_cleaner.R $^
	
clean: 
	rm -f *-cleaned.fasta

.PHONY: all clean
.DELETE_ON_ERROR:
.SECONDARY:
