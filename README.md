# Phaser variant level gene annotation

This is just a quick script that adds gene annotation using the hg38 gencode gene annotation file. A few notes:

	- Variants overlapping more than one annotation will have multiple lines in the output file 
	- the missing value notation when there's no annotation is "."
	- This script was tested with the current hg38 annotation file from gencode(included in this repo).


### Example usage

```
bash annotate.sh chr1.allelic_counts.txt GENCODE_gencode.v26.GRCh38.genes.bed out.txt 
```
