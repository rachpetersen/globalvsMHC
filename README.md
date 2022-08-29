# globalvsMHC
Comparison of genome-wide versus MHC-specific diversity and complementarity in olive baboons

R SCRIPTS:
Modeling.Rmd contains the scripts to perform modeling for aims 3-5, and the power analysis.
Supertypes.Rmd contains the scripts used to identify MHC supertypes
Figures.Rmd contains the scripts used to make the publication’s figures

SHELL SCRIPTS:
process_radtags.sh- trims, cleans, and demultiplexe ddRAD sequences
map_sort.sh- maps ddRAD reads to anubis genome using BWA aligner
ref_map.sh- reference mapping pipeline from STACKS
LD_prune.sh- prunes snps in linkage disequilibrium (needed for heterozygosity estimation)
plink_het.sh- calculates individual heterozygosity in plink
king_relatedness.sh- calculates pairwise relatedness 
normalize_snps.sh- normalizes snps from the current ddRAD dataset and the Rogers et al. 2019 diversity panel
intersect_vcfs.sh- creates intersection files between the current ddRAD dataset and the Rogers et al. 2019 diversity panel
merge_vcfs.sh- merges sites in common between the current ddRAD dataset and the Rogers et al. 2019 diversity panel
merged_het.sh- calculates individual heterozygosity using the merged (current + Rogers et al. 2019) dataset
awash_het.sh- calculates individual heterozygosity in the Bergey 2015 awash anubis dataset

DATA FILES:
Full_heterozygosity_df.csv - individual heterozygosity measures (genome-wide and MHC heterozygosity)
MHC_ddRAD_Similarity_tidy.csv - complementarity measures (genome-wide and MHC complementarity)
Variable_KEY.csv - definitions for all of the column names in the data files (Full_heterozygosity_df.csv and MHC_ddRAD_Similarity_tidy.csv) used for modeling
refmap_pruned.* - bed, bim, and fam files for calculating a kinship matrix used in modeling
ABproteins.csv - protein sequence associated with each AB allele
DQAproteins.csv - protein sequence associated with each DQA allele
DRBproteins.csv - protein sequence associated with each DRB allele
zscores.csv - z descriptors of each amino acid: z1 (hydrophobicity), z2 (steric bulk), z3 (polarity), z4 and z5 (electronic effects)
mapping_rate.csv - Number of ddRADseq reads mapping to the Papio anubis reference genome per ID
ReadCutoffs.csv- The number reads at each loci for the sequence with the fewest reads falling above the 1,000 read threshold and the sequence with the most reads falling below the 1,000 read threshold  
ab_supertypes.csv- Which supertype each AB allele falls under
drb_supertypes.csv- Which supertype each DRB allele falls under
dqa_supertypes.csv- Which supertype each DQA allele falls under
ab_hc.Rdata- hierarchical clustering of AB alleles into supertypes using the distance matrix between AB allele amino acid z-descriptor scores 
dqa_hc.Rdata- hierarchical clustering of DQA alleles into supertypes using the distance matrix between AB allele amino acid z-descriptor scores 
drb_hc.Rdata- hierarchical clustering of DRB alleles into supertypes using the distance matrix between AB allele amino acid z-descriptor scores 
IBDinput.csv- relatedness values for each dyad in the study
id_map.csv- ID map linking sample number, ID number, and name of each individual
Papio_diversity_panel_sample_IDs.csv- Papio species and populations associated with each sample used in Bergey, 2015 and Rogers et al. 2019
plink_het_output_allpapio.csv- Observed heterozygosity from individuals in the current study group, and individuals from the Roger et al. 2019 diversity panel. Calculated in plink using merged ddRADseq datasets
Awash_plink_het_output.csv- Observed heterozygosity in the Awash anubis population (Bergey, 2015) calculated in plink from ddRADseq data 
barcodes.txt- sample barcodes used for demultiplexing ddRAD data
popmap.txt- designates that all IDs are from the same population (used in ref_map.sh)
