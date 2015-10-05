#!/bin/bash

# Generate afni_proc proc* scripts for batches of participants.

# source environment script to get participant lists such as ${sessionsTypicalHOArlegPre}:
. ./00.projectEnvironment.sh
#echo $scriptDir
#echo $projDir

fxnGenTGTrlegPre(){
   # Generate proc* scripts for $sessionsTypicalTGTrlegPre :
   for session in `echo ${sessionsTypicalTGTrlegPre}`; do
      echo $session
      ./09.0.afniProcGen-taskFT-singleSession.sh $session TGTrlegPre
   done
   ls -al ~/temp.TGTrlegPre/*
}

fxnGenTGTrlegPre
