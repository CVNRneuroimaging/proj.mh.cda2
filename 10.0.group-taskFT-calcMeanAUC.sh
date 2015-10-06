#!/bin/bash

# Calculate voxelwise mean AUC for each group. Used to plot mean AUC for within-group clusters.

fxnMeanAucTGTrlegPre(){
   groupDir=/home/stowler-local/temp.TGTrlegPre
   for stimClass in EG IG; do
      3dMean \
      -prefix ${groupDir}/aucMean.${stimClass}.TGTrlegPre \
      ${groupDir}/apDir_omt0*/results*/iresp_${stimClass}*HEAD
   done
}

#fxnMeanAucTGTllegPre(){

#}
