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
   #du -sh ${groupDir}/apDir_omt*.onsetsBlock.basisTent12.includesContrast/results.*/auc_${stimClass}.*.HEAD
   3dttest++ \
   -setA \
   ${groupDir}/apDir_omt*.onsetsBlock.basisTent12.includesContrast/results.*/auc_${stimClass}.*.HEAD \
   -prefix ${groupDir}/ttest.${group}.${stimClass}.auc
}


fxnGroupTtestContrastTGTrlegPre(){
   # Group-level ttest asking whether, on average for the group, the
   # single-session tstat representing contrast of EGminusIG is non-zero.
   # NB: in this analysis single-session output subbrick 23 is t-stat for EGvsIG contrast
   group=TGTrlegPre
   groupDir=/home/stowler-local/temp.${group}
   3dttest++ \
   -setA \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt102s01.onsetsBlock.basisTent12.includesContrast/results.omt102s01.onsetsBlock.basisTent12.includesContrast/stats.omt102s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt103s01.onsetsBlock.basisTent12.includesContrast/results.omt103s01.onsetsBlock.basisTent12.includesContrast/stats.omt103s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt105s01.onsetsBlock.basisTent12.includesContrast/results.omt105s01.onsetsBlock.basisTent12.includesContrast/stats.omt105s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt108s01.onsetsBlock.basisTent12.includesContrast/results.omt108s01.onsetsBlock.basisTent12.includesContrast/stats.omt108s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt110s01.onsetsBlock.basisTent12.includesContrast/results.omt110s01.onsetsBlock.basisTent12.includesContrast/stats.omt110s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt111s01.onsetsBlock.basisTent12.includesContrast/results.omt111s01.onsetsBlock.basisTent12.includesContrast/stats.omt111s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt115s01.onsetsBlock.basisTent12.includesContrast/results.omt115s01.onsetsBlock.basisTent12.includesContrast/stats.omt115s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt120s01.onsetsBlock.basisTent12.includesContrast/results.omt120s01.onsetsBlock.basisTent12.includesContrast/stats.omt120s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt121s01.onsetsBlock.basisTent12.includesContrast/results.omt121s01.onsetsBlock.basisTent12.includesContrast/stats.omt121s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt122s01.onsetsBlock.basisTent12.includesContrast/results.omt122s01.onsetsBlock.basisTent12.includesContrast/stats.omt122s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt202s01.onsetsBlock.basisTent12.includesContrast/results.omt202s01.onsetsBlock.basisTent12.includesContrast/stats.omt202s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt203s01.onsetsBlock.basisTent12.includesContrast/results.omt203s01.onsetsBlock.basisTent12.includesContrast/stats.omt203s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt206s01.onsetsBlock.basisTent12.includesContrast/results.omt206s01.onsetsBlock.basisTent12.includesContrast/stats.omt206s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt207s01.onsetsBlock.basisTent12.includesContrast/results.omt207s01.onsetsBlock.basisTent12.includesContrast/stats.omt207s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt220s01.onsetsBlock.basisTent12.includesContrast/results.omt220s01.onsetsBlock.basisTent12.includesContrast/stats.omt220s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt221s01.onsetsBlock.basisTent12.includesContrast/results.omt221s01.onsetsBlock.basisTent12.includesContrast/stats.omt221s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt226s01.onsetsBlock.basisTent12.includesContrast/results.omt226s01.onsetsBlock.basisTent12.includesContrast/stats.omt226s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt312s01.onsetsBlock.basisTent12.includesContrast/results.omt312s01.onsetsBlock.basisTent12.includesContrast/stats.omt312s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt314s01.onsetsBlock.basisTent12.includesContrast/results.omt314s01.onsetsBlock.basisTent12.includesContrast/stats.omt314s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt317s01.onsetsBlock.basisTent12.includesContrast/results.omt317s01.onsetsBlock.basisTent12.includesContrast/stats.omt317s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt318s01.onsetsBlock.basisTent12.includesContrast/results.omt318s01.onsetsBlock.basisTent12.includesContrast/stats.omt318s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTrlegPre/apDir_omt320s01.onsetsBlock.basisTent12.includesContrast/results.omt320s01.onsetsBlock.basisTent12.includesContrast/stats.omt320s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   -prefix ${groupDir}/ttest.${group}.EGminusIG.tstatOfContrast
}


fxnGroupTtestContrastTGTllegPre(){
   # Group-level ttest asking whether, on average for the group, the
   # single-session tstat representing contrast of EGminusIG is non-zero.
   # NB: in this analysis single-session output subbrick 23 is t-stat for EGvsIG contrast
   group=TGTllegPre
   groupDir=/home/stowler-local/temp.${group}
   3dttest++ \
   -setA \
   /home/stowler-local/temp.TGTllegPre/apDir_omt106s01.onsetsBlock.basisTent12.includesContrast/results.omt106s01.onsetsBlock.basisTent12.includesContrast/stats.omt106s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt113s01.onsetsBlock.basisTent12.includesContrast/results.omt113s01.onsetsBlock.basisTent12.includesContrast/stats.omt113s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt114s01.onsetsBlock.basisTent12.includesContrast/results.omt114s01.onsetsBlock.basisTent12.includesContrast/stats.omt114s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt116s01.onsetsBlock.basisTent12.includesContrast/results.omt116s01.onsetsBlock.basisTent12.includesContrast/stats.omt116s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt119s01.onsetsBlock.basisTent12.includesContrast/results.omt119s01.onsetsBlock.basisTent12.includesContrast/stats.omt119s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt201s01.onsetsBlock.basisTent12.includesContrast/results.omt201s01.onsetsBlock.basisTent12.includesContrast/stats.omt201s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt204s01.onsetsBlock.basisTent12.includesContrast/results.omt204s01.onsetsBlock.basisTent12.includesContrast/stats.omt204s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt205s01.onsetsBlock.basisTent12.includesContrast/results.omt205s01.onsetsBlock.basisTent12.includesContrast/stats.omt205s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt211s01.onsetsBlock.basisTent12.includesContrast/results.omt211s01.onsetsBlock.basisTent12.includesContrast/stats.omt211s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt214s01.onsetsBlock.basisTent12.includesContrast/results.omt214s01.onsetsBlock.basisTent12.includesContrast/stats.omt214s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt215s01.onsetsBlock.basisTent12.includesContrast/results.omt215s01.onsetsBlock.basisTent12.includesContrast/stats.omt215s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt219s01.onsetsBlock.basisTent12.includesContrast/results.omt219s01.onsetsBlock.basisTent12.includesContrast/stats.omt219s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt222s01.onsetsBlock.basisTent12.includesContrast/results.omt222s01.onsetsBlock.basisTent12.includesContrast/stats.omt222s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt223s01.onsetsBlock.basisTent12.includesContrast/results.omt223s01.onsetsBlock.basisTent12.includesContrast/stats.omt223s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt225s01.onsetsBlock.basisTent12.includesContrast/results.omt225s01.onsetsBlock.basisTent12.includesContrast/stats.omt225s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt301s01.onsetsBlock.basisTent12.includesContrast/results.omt301s01.onsetsBlock.basisTent12.includesContrast/stats.omt301s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt302s01.onsetsBlock.basisTent12.includesContrast/results.omt302s01.onsetsBlock.basisTent12.includesContrast/stats.omt302s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt304s01.onsetsBlock.basisTent12.includesContrast/results.omt304s01.onsetsBlock.basisTent12.includesContrast/stats.omt304s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt305s01.onsetsBlock.basisTent12.includesContrast/results.omt305s01.onsetsBlock.basisTent12.includesContrast/stats.omt305s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt308s01.onsetsBlock.basisTent12.includesContrast/results.omt308s01.onsetsBlock.basisTent12.includesContrast/stats.omt308s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt310s01.onsetsBlock.basisTent12.includesContrast/results.omt310s01.onsetsBlock.basisTent12.includesContrast/stats.omt310s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt311s01.onsetsBlock.basisTent12.includesContrast/results.omt311s01.onsetsBlock.basisTent12.includesContrast/stats.omt311s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   /home/stowler-local/temp.TGTllegPre/apDir_omt315s01.onsetsBlock.basisTent12.includesContrast/results.omt315s01.onsetsBlock.basisTent12.includesContrast/stats.omt315s01.onsetsBlock.basisTent12.includesContrast_REML+tlrc'[23]' \
   -prefix ${groupDir}/ttest.${group}.EGminusIG.tstatOfContrast
}



# All group-level tests for TGTrlegPre:

#fxnGroupTtestStim EG TGTrlegPre
#fxnGroupTtestStim IG TGTrlegPre
#fxnGroupTtestContrastTGTrlegPre


# All group-level tests for TGTllegPre:

#fxnGroupTtestStim EG TGTllegPre
#fxnGroupTtestStim IG TGTllegPre
#fxnGroupTtestContrastTGTllegPre
