#!/bin/sh
#
# ----------------------------------------------------------------------------------------
# --- KING relatedness
# ----------------------------------------------------------------------------------------

module load plink/1.90b6.21
module load plink2/20210103



plink --map /scratch/rp2276/stacks/refmap_output/populations.plink.map \
--ped /scratch/rp2276/stacks/refmap_output/populations.plink.ped  \
--allow-extra-chr --make-bed --out /scratch/rp2276/stacks/king/plink

plink2 --bfile /scratch/rp2276/stacks/king/plink  --make-king-table --allow-extra-chr
