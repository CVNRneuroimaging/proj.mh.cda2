#!/bin/bash

# Perform group-level voxelwise t-tests. 

fxnGroupTtestStim(){
   # Voxelwise group-level ttest asking whether, on average for the group, a
   # voxel's AUC is non-zero for a particular stimulus class.
   #
   # Call with stimClass and group as arguments,
   # e.g., fxnGroupTtestStim EG TGTrlegPre

   stimClass=$1
   group=$2
   groupDir=/home/stowler-local/temp.${group}
   3dttest++ \
   -setA \
   ${groupDir}/apDir_omt*.onsetsBlock.basisTent12.includesContrast/results.*/auc_${stimClass}.*.HEAD \
   -prefix ${groupDir}/ttest.${group}.${stimClass}.auc
}


fxnGroupTtestContrastTGTrlegPre(){
   # Group-level ttest asking whether, on average for the group, the
   # single-session tstat representing contrast of EGminusIG is non-zero.
   group=TGTrlegPre
   groupDir=/home/stowler-local/temp.${group}
   3dttest++ \
   -setA \
   # tstats from results...probably subbrick 23
   -prefix ${groupDir}/ttest.${group}.EGminusIG.tstatOfContrast
}


fxnGroupTtestContrastTGTllegPre(){
   # Group-level ttest asking whether, on average for the group, the
   # single-session tstat representing contrast of EGminusIG is non-zero.
   group=TGTllegPre
   groupDir=/home/stowler-local/temp.${group}
   3dttest++ \
   -setA \
   # tstats from results...probably subbrick 23
   -prefix ${groupDir}/ttest.${group}.EGminusIG.tstatOfContrast
}



# All group-level tests for TGTrlegPre:

fxnGroupTtestStim EG TGTrlegPre
#fxnGroupTtestStim IG TGTrlegPre
#fxnGroupTtestContrastTGTrlegPre


# All group-level tests for TGTllegPre:

#fxnGroupTtestStim EG TGTllegPre
#fxnGroupTtestStim IG TGTllegPre
#fxnGroupTtestContrastTGTllegPre
