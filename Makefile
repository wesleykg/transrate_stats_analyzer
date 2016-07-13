all: $(patsubst %.fa, %_cleaned.fasta, $(wildcard *.fa))

protein: $(patsubst %.faa, %_cleaned.fasta, $(wildcard *.faa))

%_cleaned.fasta: %.fa $(genome)-SOAPdenovo-Trans-Transrate-stats.tsv
	Rscript trs_cleaner.R $^
	
%_cleaned.fasta: %.faa $(genome)-SOAPdenovo-Trans-Transrate-stats.tsv
	Rscript trs_cleaner.R $^
	
clean: 
	rm -f *_cleaned.fasta

.PHONY: all clean
.DELETE_ON_ERROR:
.SECONDARY:
