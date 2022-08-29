#!/bin/sh
#
# ----------------------------------------------------------------------------------------
# --- Calculate heterozygosity in Awash anubis
# ----------------------------------------------------------------------------------------

module load plink/1.90b6.21

awash_path= $PWD/awash_data

plink --vcf all.auto.cleaned.bi.groupC.anubis.recode.vcf --recode --out awash_olive

plink --map ${awash_path}/awash_olive.map \
--ped ${awash_path}/awash_olive.ped \
--indep-pairwise 50 5 0.5 --allow-extra-chr \
--out ${awash_path}/LD

plink --map ${awash_path}/awash_olive.map \
--ped ${awash_path}/awash_olive.ped \
--extract ${awash_path}/LD.prune.in --allow-extra-chr \
--make-bed --out ${awash_path}/pruned

plink --bfile ${awash_path}/pruned \
--het --allow-extra-chr --out ${awash_path}/
