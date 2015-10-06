#!/bin/bash

# source environment script to get participant lists such as ${sessionsTypicalHOArlegPre}:
. ./00.projectEnvironment.sh
echo $scriptDir
echo $projDir


fxnExecuteProcHOArlegPre(){
   # Execute the proc script for each sessionsTypicalHOArlegPre session, serially:
   parentDir=/home/stowler-local/temp
   for session in ${sessionsTypicalHOArlegPre}; do
      #echo "session is $session"
      cd ${parentDir}/apDir_${session}.onsetsBlock.basisTent12.includesContrast
      tcsh -xef proc.${session}.onsetsBlock.basisTent12.includesContrast |& tee output.proc.${session}.onsetsBlock.basisTent12.includesContrast
   done
}

fxnExecuteProcTGTrlegPre(){
   # Execute the proc script for each TGTrlegPre session, serially:
   parentDir=/home/stowler-local/temp.TGTrlegPre
   for session in ${sessionsTypicalTGTrlegPre}; do
      echo ""
      echo "session is $session"
      du -sh ${parentDir}/apDir_${session}.onsetsBlock.basisTent12.includesContrast
      cd     ${parentDir}/apDir_${session}.onsetsBlock.basisTent12.includesContrast
      tcsh -xef proc.${session}.onsetsBlock.basisTent12.includesContrast |& tee output.proc.${session}.onsetsBlock.basisTent12.includesContrast
   done
}

fxnExecuteProcTGTllegPre(){
   # Execute the proc script for each TGTllegPre session, serially:
   parentDir=/home/stowler-local/temp.TGTllegPre
   for session in ${sessionsTypicalTGTllegPre}; do
      echo ""
      echo "session is $session"
      du -sh ${parentDir}/apDir_${session}.onsetsBlock.basisTent12.includesContrast
      cd     ${parentDir}/apDir_${session}.onsetsBlock.basisTent12.includesContrast
      tcsh -xef proc.${session}.onsetsBlock.basisTent12.includesContrast |& tee output.proc.${session}.onsetsBlock.basisTent12.includesContrast
   done
}

fxnCreateAUC(){
   # Calculate single-session AUC for sessions in the group.
   #
   # Super-lazy: edit $group and for loop's control variable to generate for group of interest. Pairs:
   #     HOArlegPre  $sessionsTypicalHOArlegPre
   #     TGTrlegPre  $sessionsTypicalTGTrlegPre
   #     TGTllegPre  $sessionsTypicalTGTllegPre

   group=TGTrlegPre
   groupDir=/home/stowler-local/temp.${group}
   for session in ${sessionsTypicalTGTrlegPre}; do
      apDir=${groupDir}/apDir_${session}.onsetsBlock.basisTent12.includesContrast
      resultsDir=${apDir}/results.${session}.onsetsBlock.basisTent12.includesContrast
      irespEG=${resultsDir}/iresp_EG.${session}.onsetsBlock.basisTent12.includesContrast+tlrc.HEAD
      irespIG=${resultsDir}/iresp_IG.${session}.onsetsBlock.basisTent12.includesContrast+tlrc.HEAD
      #ls -al ${irespEG}
      #ls -al ${irespIG}

      # Ugh...this script deleted every uncommitted file in my source tree
      # because "aucPrefixIG" was accidentally written as "aucPrefixEG", which
      # leaves the IG undefined in below "rm -f ${aucPrefixIG}*", which just
      # translates to "rm -f *".
      aucPrefixEG=${resultsDir}/auc_EG.${session}.onsetsBlock.basisTent12.includesContrast
      aucPrefixIG=${resultsDir}/auc_IG.${session}.onsetsBlock.basisTent12.includesContrast

      rm -f ${aucPrefixEG}*
      rm -f ${aucPrefixIG}*

      3dcalc -prefix ${aucPrefixEG} \
         -a0 ${irespEG} \
         -b1 ${irespEG} \
         -c2 ${irespEG} \
         -d3 ${irespEG} \
         -e4 ${irespEG} \
         -expr '(0.5*a)+b+c+d+(0.5*e)'

      3dcalc -prefix ${aucPrefixIG} \
         -a0 ${irespIG} \
         -b1 ${irespIG} \
         -c2 ${irespIG} \
         -d3 ${irespIG} \
         -e4 ${irespIG} \
         -expr '(0.5*a)+b+c+d+(0.5*e)'

      echo ""
      ls -l ${aucPrefixEG}*
      ls -l ${aucPrefixIG}*
      echo "...done calculating AUC."
   done
}

# Call each of these functions without arguments to launch serial execution of
# all of one group's afni_proc proc scripts (call one function, give it about
# four hours to run to completion, then call another):

#fxnExecuteProcTGTrlegPre
#fxnExecuteProcTGTllegPre

# After completion of a group's afni_proc proc scripts, generate AUC file for
# each session in the group:
#
# (NB: see top of function for the lazy way I specify which group)
fxnCreateAUC
