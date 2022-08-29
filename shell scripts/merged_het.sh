#!/bin/sh
#
# ----------------------------------------------------------------------------------------
# --- Calculate heterozygosity in merged refmap & diversity panel SNPs
# ----------------------------------------------------------------------------------------

module load plink/1.90b6.21

plink --vcf merged_intersection.vcf \
--allow-extra-chr --recode --out merged_intersection

plink --map $PWD/merged_intersection.map \
--ped $PWD/merged_intersection.ped \
--indep-pairwise 50 5 0.5 --allow-extra-chr \
--out $PWD/all_papio_het/LD

plink --map $PWD/merged_intersection.map \
--ped $PWD/merged_intersection.ped \
--extract $PWD/all_papio_het/LD.prune.in --allow-extra-chr \
--make-bed --out $PWD/all_papio_het/pruned

plink --bfile $PWD/all_papio_het/pruned \
--het --allow-extra-chr --out $PWD/all_papio_het/allpapio
