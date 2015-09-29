#!/bin/bash

# source environment script to get participant lists such as ${sessionsTypicalHOArlegPre}:
. 00.projectEnvironment.sh
echo $scriptDir
echo $projDir

parentDir=/home/stowler-local/temp

fxnExecuteProc(){
   # Execute the proc script for each sessionsTypicalHOArlegPre session, serially:
   for session in ${sessionsTypicalHOArlegPre}; do
      #echo "session is $session"
      cd ${parentDir}/apDir_${session}.onsetsBlock.basisTent12.includesContrast
      tcsh -xef proc.${session}.onsetsBlock.basisTent12.includesContrast |& tee output.proc.${session}.onsetsBlock.basisTent12.includesContrast
   done
}

fxnCreateAUC(){
   for session in ${sessionsTypicalHOArlegPre}; do
      apDir=${parentDir}/apDir_${session}.onsetsBlock.basisTent12.includesContrast
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

fxnCreateAUC
