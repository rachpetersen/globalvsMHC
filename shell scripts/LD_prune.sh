#!/bin/sh
#
# ----------------------------------------------------------------------------------------
# --- Prune for sites in linkage disequilibrium, recode
# ----------------------------------------------------------------------------------------

module load plink/1.90b6.21

refmap_path= $PWD/refmap_output
out_path= $PWD/LD_output

plink --map ${refmap_path}/populations.plink.map \
--ped ${refmap_path}/populations.plink.ped \
--indep-pairwise 50 5 0.5 --allow-extra-chr --out ${out_path}/LD

plink --map ${refmap_path}/populations.plink.map \
--ped ${refmap_path}/populations.plink.ped  \
--extract ${out_path}/LD.prune.in --allow-extra-chr \
--make-bed --out ${out_path}/pruned

plink --bfile ${out_path}/pruned --allow-extra-chr --recode12
