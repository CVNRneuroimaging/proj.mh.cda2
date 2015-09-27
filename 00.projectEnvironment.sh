#!/bin/bash

# 00.projectEnvironment.sh
#
# Setup environment for subsequent scripts.

fxnCheckSessions(){
   # Function to check the completeness of a session.
   #
   # Call like: fxnCheckSessions "$sessions2015NovControlPre"
   #
   # Returns size of the session's individual analysis products, or if a
   # particular product is not present (non-zero), it is added to a list of
   # missing products which is printed to stdout at the end of the fxn.


   # These are the suffixes of per-session outputs that should be found in ${projDir}/derivedData/${session}/
   suffixListAnat="manualCOG.txt anat.nii.gz anat_brain.nii.gz anat_brain_mask.nii.gz optiBET"
   suffixListQC="qcReport-FBIRN-rest qcReport-FBIRN-taskFT"
   suffixListFmri="fmri.rest.run1.nii.gz fmri.taskFT.run1.nii.gz fmri.taskFT.run2.nii.gz fmri.taskFT.run3.nii.gz fmri.taskFT.run4.nii.gz"
   suffixListMelodicFixNone="fmri.rest.run1.melodicFixNone.ica fmri.taskFT.run1.melodicFixNone.ica fmri.taskFT.run2.melodicFixNone.ica fmri.taskFT.run3.melodicFixNone.ica fmri.taskFT.run4.melodicFixNone.ica"

   #suffixListMelodicFixRest="fmri.rest.run1.melodicFixStandard20*ica fmri.rest.run1.melodicFixStandard18*ica fmri.rest.run1.melodicFixStandard15*ica fmri.rest.run1.melodicFixStandard10*ica fmri.rest.run1.melodicFixWhII_Standard20*ica fmri.rest.run1.melodicFixWhII_Standard18*ica fmri.rest.run1.melodicFixWhII_Standard15*ica fmri.rest.run1.melodicFixWhII_Standard10*ica"
   suffixListMelodicFixRest="fmri.rest.run1.melodicFixStandard20*ica fmri.rest.run1.melodicFixStandard18*ica fmri.rest.run1.melodicFixStandard15*ica"

   suffixListMelodicFixTaskRun1="fmri.taskFT.run1.melodicFixStandard20*ica fmri.taskFT.run1.melodicFixStandard18*ica fmri.taskFT.run1.melodicFixStandard15*ica fmri.taskFT.run1.melodicFixStandard10*ica fmri.taskFT.run1.melodicFixWhII_Standard20*ica fmri.taskFT.run1.melodicFixWhII_Standard18*ica fmri.taskFT.run1.melodicFixWhII_Standard15*ica fmri.taskFT.run1.melodicFixWhII_Standard10*ica"
   suffixListMelodicFixTaskRun2="fmri.taskFT.run2.melodicFixStandard20*ica fmri.taskFT.run2.melodicFixStandard18*ica fmri.taskFT.run2.melodicFixStandard15*ica fmri.taskFT.run2.melodicFixStandard10*ica fmri.taskFT.run2.melodicFixWhII_Standard20*ica fmri.taskFT.run2.melodicFixWhII_Standard18*ica fmri.taskFT.run2.melodicFixWhII_Standard15*ica fmri.taskFT.run2.melodicFixWhII_Standard10*ica"
   suffixListMelodicFixTaskRun3="fmri.taskFT.run3.melodicFixStandard20*ica fmri.taskFT.run3.melodicFixStandard18*ica fmri.taskFT.run3.melodicFixStandard15*ica fmri.taskFT.run3.melodicFixStandard10*ica fmri.taskFT.run3.melodicFixWhII_Standard20*ica fmri.taskFT.run3.melodicFixWhII_Standard18*ica fmri.taskFT.run3.melodicFixWhII_Standard15*ica fmri.taskFT.run3.melodicFixWhII_Standard10*ica"
   suffixListMelodicFixTaskRun4="fmri.taskFT.run4.melodicFixStandard20*ica fmri.taskFT.run4.melodicFixStandard18*ica fmri.taskFT.run4.melodicFixStandard15*ica fmri.taskFT.run4.melodicFixStandard10*ica fmri.taskFT.run4.melodicFixWhII_Standard20*ica fmri.taskFT.run4.melodicFixWhII_Standard18*ica fmri.taskFT.run4.melodicFixWhII_Standard15*ica fmri.taskFT.run4.melodicFixWhII_Standard10*ica"
   suffixList="${suffixListAnat} ${suffixListQC} ${suffixListFmri} ${suffixListMelodicFixNone} ${suffixListMelodicFixRest} ${suffixListMelodicFixTaskRun1} ${suffixListMelodicFixTaskRun2} ${suffixListMelodicFixTaskRun3} ${suffixListMelodicFixTaskRun4}"
   rm -f /tmp/missingOutputList.txt
   echo ""
   echo "Checking sessions for completeness:"
   echo ""
   sessionList="${1}"
   for session in `echo "${sessionList}"`; do
      echo ""
      echo "File and diredtory sizes in session $session:"
      for suffix in ${suffixList}; do
         if [ -s ${projDir}/derivedData/${session}/*${suffix} ]; then
            du -sh ${projDir}/derivedData/${session}/*${suffix}
         else
            echo "${projDir}/derivedData/${session}/*${suffix}" >> /tmp/missingOutputList.txt
         fi
      done
   done

echo ""
echo "Missing products from sessionList ${sessionList}:"
echo ""
cat /tmp/missingOutputList.txt
}



export projDir="/data/panolocal/processedOnPano-hackney"
export scriptDir="/home/stowler-local/src.mywork.gitRepos/proj.mh.cda2"


###########################################################
# "atypical" sessions 
# (per the definition of typical, further down)
#
# omt016s01 - eprime run3 died per MH
# omt219s01 - missing rest only (TBD: why?)
#
# omt022s01 - missing fmri.taskFT.run1 (TBD: recreate...had good run1 plus short-TR false start, move to typical lists)
# omt304s01 - missing fmri.taskFT.run1 (TBD: recreate...had good run1 plus short-TR false start, move to typical lists)
# omt205s01 - missing fmri.taskFT.run2 (TBD: recreate...had good run2 plus short-TR false start, move to typical lists)
#
# omt221s01 - missing anat because dicom store has two copies of anat (TBD: recreate from single, move to typical lists)
#
# omt201s01 - not in acqfiles-nifti - has strange s1,s2,s3 situation - see sept 14 email and TBD: fix
# omt122s01 - not in acqfiles-nifti - telomere acquired sept XX 
# omt222s01 - not in acqfiles-nifti - telomere acq aug XX
# omt223s01 - not in acqfiles-nifti - telomere acq. sept XX and sept XX 
# omt225s01 - not in acqfiles-nifti - telomere acq. sept XX
# omt226s01 - not in acqfiles-nifti - telomere acq. sept XX
# 

###########################################################
# Lists of "typical" sessions, each of which includes:
#     1 anat
#     1 fmri.rest
#     4 fmri.taskFT
#
# Abbreviations and session IDs:
# - abbreviation "HOA" for "healthy older adult" controls
# - abbreviation "TGT" for "target" participants, because they are the target of the treatment paradigm
# - omt0XXsXX - session IDs for healthy older adult participants
# - omt1XXsXX - session IDs for target particpants acting as treatment "leaders"
# - omt2XXsXX - session IDs for target particpants acting as treatment "followers"
# - omt3XXsXX - session IDs for target particpants acting as treatment "educational controls"

sessionsTypicalHOAllegPre="omt027s01"
sessionsTypicalHOArlegPre="omt001s01 omt003s01 omt004s01 omt006s01 omt007s01 omt008s01 omt009s01 omt010s01 omt011s01 omt012s01 omt013s01 omt015s01 omt021s01 omt023s01 omt024s01 omt025s01 omt028s01 omt029s01 omt030s01 omt031s01"
sessionsTypicalTGTrlegPre="omt102s01 omt103s01 omt105s01 omt108s01 omt110s01 omt111s01 omt115s01 omt120s01 omt121s01 omt122s01 omt202s01 omt203s01 omt206s01 omt207s01 omt220s01 omt221s01 omt226s01 omt312s01 omt314s01 omt317s01 omt318s01 omt320s01"
sessionsTypicalTGTllegPre="omt106s01 omt113s01 omt114s01 omt116s01 omt119s01 omt201s01 omt204s01 omt205s01 omt211s01 omt214s01 omt215s01 omt219s01 omt222s01 omt223s01 omt225s01 omt301s01 omt302s01 omt304s01 omt305s01 omt308s01 omt310s01 omt311s01 omt315s01"

#######################################################################
# Lists of sessions for 2015oct analysis. Each session must include:
#     1 anat
#     4 fmri.taskFT
#


#!!!!!!!!!!!!!!!!
# NB: on OS X but not linux, sed doesn't respect the \n below, and needs to be
# replaced with a call to gsed. Echo may also need to be replaced with echo -e
# (TBD).
#!!!!!!!!!!!!!!!!
# convert lists from rows to columns for other use:
export sessionsTypicalHOArlegPre_column="`echo ${sessionsTypicalHOArlegPre} | sed 's/ /\n/g'`"
#echo "$sessionsTypicalHOArlegPre_column"
export sessionsTypicalTGTrlegPre_column="`echo ${sessionsTypicalTGTrlegPre} | sed 's/ /\n/g'`"
#echo "$sessionsTypicalTGTrlegPre_column"
export sessionsTypicalTGTllegPre_column="`echo ${sessionsTypicalTGTllegPre} | sed 's/ /\n/g'`"
#echo "$sessionsTypicalTGTllegPre_column"

#fxnCheckSessions "${sessionsTypicalHOArlegPre}"
