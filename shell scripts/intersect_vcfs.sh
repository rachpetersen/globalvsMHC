#!/bin/sh
#
# ----------------------------------------------------------------------------------------
# --- Intersect refmap and diversity panel files
# ----------------------------------------------------------------------------------------

module load bcftools/intel/1.14

out_path= $PWD/merged_vcfs
refmap_path= $PWD/refmap_output

bcftools isec -p ${out_path} \
${refmap_path}/populations.snps.reheader.sort.norm.vcf.gz \
$PWD/Papio.spp.snps.final.rename.sort.norm.vcf.gz
