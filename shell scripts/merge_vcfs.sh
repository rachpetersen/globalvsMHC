#!/bin/sh
#
# ----------------------------------------------------------------------------------------
# --- Merge vcfs at intersected sites
# ----------------------------------------------------------------------------------------

module load vcftools/intel/0.1.16
module load samtools/intel/1.14

cd /vast/rp2276/stacks/merged_vcfs

bgzip -k -f 0003_filtered.vcf.recode.vcf
bgzip -k -f 0002.vcf

tabix -p vcf 0003_filtered.vcf.recode.vcf.gz
tabix -p vcf 0002.vcf.gz

vcf-merge 0003_filtered.vcf.recode.vcf.gz 0002.vcf.gz > merged_intersecti
