#!/bin/bash

# Calculate voxelwise mean iresp for each group. Used to plot mean iresp for within-group clusters.

fxnMeanIrespTGTrlegPre(){
   groupDir=/home/stowler-local/temp.TGTrlegPre
   for stimClass in EG IG; do
      3dMean \
      -prefix ${groupDir}/irespMean.${stimClass}.TGTrlegPre \
      ${groupDir}/apDir_omt*/results*/iresp_${stimClass}*HEAD
   done
}

fxnMeanIrespTGTrlegPre
