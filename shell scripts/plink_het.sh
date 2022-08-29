#!/bin/sh
#
# ----------------------------------------------------------------------------------------
# --- Plink heterozygosity analyses
# ----------------------------------------------------------------------------------------

module load plink/1.90b6.21

het_path= $PWD/LD_output/pruned

plink --bfile ${het_path} --het --allow-extra-chr 
