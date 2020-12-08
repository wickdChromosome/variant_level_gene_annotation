infile=$1
annotate_bed=$2
outname=$3

#save the header, add gene name to it
filehead=$(head -n 1 ${infile})$'\t'name

#intersect based on gene intervals
bedtools intersect -loj -a <(tail -n +2 ${infile}) -b ${annotate_bed} > ${outname}.temp

#cut out all the unnecessary shit
echo ${filehead} | sed 's/ /\t/g' > ${outname}
cat ${outname}.temp | cut -f-8,12 >> ${outname}

rm ${outname}.temp

