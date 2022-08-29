#!/bin/sh
#
# ----------------------------------------------------------------------------------------
# --- Normalize snps (prior to merging refmap output and papio diveristy panel)
# ----------------------------------------------------------------------------------------

module load bcftools/intel/1.14

bcftools norm --multiallelics '-any' populations.snps.reheader.sort.vcf.gz | \
bcftools norm -c w -f ${genome_path} | \
bcftools sort > populations.snps.reheader.norm.vcf

bgzip -i -k -f populations.snps.reheader.sort.norm.vcf

bcftools index populations.snps.reheader.sort.norm.vcf.gz

cd /vast/rp2276/stacks

bcftools norm --multiallelics '-any' Papio.spp.snps.final.rename.vcf.gz | \
bcftools norm -c w -f ${genome_path} > Papio.spp.snps.final.rename.norm.vcf

bcftools sort Papio.spp.snps.final.rename.norm.vcf > Papio.spp.snps.final.rename.sort.norm.vcf

bgzip -i -k -f Papio.spp.snps.final.rename.sort.norm.vcf
bcftools index Papio.spp.snps.final.rename.sort.norm.vcf.gz
