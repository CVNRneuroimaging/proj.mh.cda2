#!/bin/bash

# 00.projectEnvironment.sh
#
# Setup environment for subsequent scripts.

export projDir="/data/panolocal/processedOnPano-hackney"
export scriptDir="~stowler-local/src.mywork.gitRepos/proj.mh.cda2"


###########################################################
# "atypical" sessions 
# (per the definition of typical, further down)
#
# omt016s01 - eprime run3 died per MH
# omt022s01 - missing fmri.taskFT.run1 (TBD: recreate...had good run1 plus short-TR false start, move to typical lists)
# omt221s01 - missing anat because dicom store has two copies of anat (TBD: recreate from single, move to typical lists)
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

#sessionsTypicalTGTlPre=

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
echo "$sessionsTypicalTGTrlegPre_column"
