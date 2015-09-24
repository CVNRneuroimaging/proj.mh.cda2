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


###########################################################
# Lists of "typical" sessions, each of which includes:
#     1 anat
#     1 fmri.rest
#     4 fmri.taskFT


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
#export sessionsTypical_column="`echo ${sessionsTypical} | sed 's/ /\n/g'`"
#echo "$sessionsTypical_column"
