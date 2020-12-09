infile=$1
annotate_bed=$2
outname=$3

#save the header, add gene name to it
filehead=$(head -n 1 ${infile} | sed 's/position/position1\tposition2/g')$'\t'name

#cut the header
tail -n +2 ${infile} > ${outname}_nohead.temp 

echo "Adding new pos columns"
#add the pos-1 column
paste -d$'\t' <(awk -F '\t' '{ print $1,$2-1,$2}' ${outname}_nohead.temp | sed 's/ /\t/g' ) <(cut -d$'\t' -f3- ${outname}_nohead.temp) > ${outname}_addedpos.temp

echo "Doing intersection using bedtools"
#intersect based on gene intervals
bedtools intersect -loj -a ${outname}_addedpos.temp -b ${annotate_bed} > ${outname}.temp

echo "Writing final file"
#cut out all the unnecessary shit
echo ${filehead} | sed 's/ /\t/g' > ${outname}
cat ${outname}.temp | cut -f-9,13 >> ${outname}

#rm ${outname}.temp

