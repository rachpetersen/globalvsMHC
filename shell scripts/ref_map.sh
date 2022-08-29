#!/bin/sh
#
# ----------------------------------------------------------------------------------------
# --- Stacks reference mapping pipeline
# ----------------------------------------------------------------------------------------

module purge
module load stacks/intel/2.55

out_path= $PWD/refmap_output
sort_path= $PWD/sortedsamples

ref_map.pl -T 12 -o ${out_path} \
--samples ${sort_path} \
--popmap $PWD/popmap.txt \
-X populations:"-r .80 --fstats --plink --vcf"
