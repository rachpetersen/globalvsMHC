#!/bin/sh
#
# ----------------------------------------------------------------------------------------
# --- Clean data using stacks process_radtags
# ----------------------------------------------------------------------------------------

module purge
module load stacks/intel/2.55

data_path= $PWD/raw
out_path= $PWD/cleansamples

process_radtags -P -p ${data_path} \
-b barcodes.txt \
-o ${out_path} \
-c -q -r --index_null --renz_1 sphI --renz_2 mluCI 
