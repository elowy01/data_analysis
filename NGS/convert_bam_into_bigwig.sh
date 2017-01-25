inprefix=accepted_hits

samtools view -H ${inprefix}.bam | awk '$1 == "@SQ" {OFS="\t";print $2,$3}' - | sed 's/.N://g' > ${inprefix}.tab

bsub -q production-rh6 -M 8000 -o log -e err "samtools view -b ${inprefix}.bam | bamToBed -split | genomeCoverageBed -g ${inprefix}.tab -i stdin -bg | wigToBigWig stdin ${inprefix}.tab ${inprefix}.bw"

