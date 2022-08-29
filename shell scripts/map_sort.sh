#!/bin/sh
#
# ----------------------------------------------------------------------------------------
# --- Map reads, sort reads
# ----------------------------------------------------------------------------------------

module load bwa/intel/0.7.17
module load samtools/intel/1.11

clean_path= $PWD/cleansamples
map_path= $PWD/mappedsamples
sort_path= $PWD/sortedsamples

IDs=( 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 17 18 20 21 91 97 113 )

for i in ${IDs[@]}; do
bwa mem -t 25 $PWD/Panu3.fna.gz \
${clean_path}/ID_$i.1.fq.gz \
${clean_path}/ID_$i.2.fq.gz \
| samtools view -S -b  > ${map_path}/$i.bam
done


for i in ${IDs[@]}; do
samtools sort ${map_path}/$i.bam \
-o ${sort_path}/$i.bam
done
