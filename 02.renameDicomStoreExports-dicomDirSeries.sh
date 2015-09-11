#!/bin/bash

# 02.renameDicomStoreExports-dicomDirSeries.sh
#
# Create groomed directories of dicoms for conversion to nifti. "Groomed"
# meaning that each dicomdir contains only one series, and has been given the
# name that the eventual nifti should take:
#
#     anat
#     fmri.rest.run1
#     fmri.taskFT.run1
#     fmri.taskFT.run2
#     fmri.taskFT.run3
#     fmri.taskFT.run4



# These are all of the unique dicomdir names that appear in the dicomstore exports:

# $ ls -d /data/tmpHackney/exportedFromDicomStore/fixedSessionName/*/* | xargs basename | sort | uniq


# SEQUENCE NAMES I AM PROCESSING
#=========================================

# MPRAGE_SAGITTAL
# RESTING_STATE
# axial_DANCE1
# axial_DANCE2
# axial_DANCE3
# axial_DANCE4

# SEQUENCE NAMES I AM NOT CURRENTLY PROCESSING
#=================================================
# Localizers
# PhoenixZIPReport
# gre_field_mapping_3x3x3
# AX_FLAIR
# Hires_2D_T2w_TSE_Coronal       ...only OMT98s01
# axial_DANCE1_RT_FOOT
# axial_DANCE2_RT_FOOT
# axial_DANCE3_RT_FOOT
# axial_DANCE4_LT_FOOT
# axial_DANCE5_LT_FOOT
# axial_DANCE6_LT_FOOT


# PROBLEM SERIES:
# =====================
# du: /data/tmpHackney/exportedFromDicomStore/groomedForNiftiConversion/omt016s01/fmri.taskFT.run2: No such file or directory
# ....also reflected in hal's dicomstore

# du: /data/tmpHackney/exportedFromDicomStore/groomedForNiftiConversion/omt026s01/fmri.rest.run1: No such file or directory
# ...also reflected in hal's dicomstore

# du: /data/tmpHackney/exportedFromDicomStore/groomedForNiftiConversion/omt201s02/fmri.rest.run1: No such file or directory
# ...see the strange s1, s2, s3 situation. Needs to be reconciled w/ MH.
#
# not a surprise: these are pilots
# du: /data/tmpHackney/exportedFromDicomStore/groomedForNiftiConversion/omt998s01/fmri.rest.run1: No such file or directory
# du: /data/tmpHackney/exportedFromDicomStore/groomedForNiftiConversion/omt998s01/fmri.taskFT.run1: No such file or directory
# du: /data/tmpHackney/exportedFromDicomStore/groomedForNiftiConversion/omt998s01/fmri.taskFT.run2: No such file or directory
# du: /data/tmpHackney/exportedFromDicomStore/groomedForNiftiConversion/omt998s01/fmri.taskFT.run3: No such file or directory
# du: /data/tmpHackney/exportedFromDicomStore/groomedForNiftiConversion/omt998s01/fmri.taskFT.run4: No such file or directory
# du: /data/tmpHackney/exportedFromDicomStore/groomedForNiftiConversion/omt999s01/fmri.rest.run1: No such file or directory
# du: /data/tmpHackney/exportedFromDicomStore/groomedForNiftiConversion/omt999s01/fmri.taskFT.run4: No such file or directory



fxnGroomOneSession(){
    # parent directory that contains all of a session's individual dicomdirs:
    inputParentDir=/data/tmpHackney/exportedFromDicomStore/fixedSessionName/${sessionName}

    rm -fr ${outputGroomedParent}/${sessionName}
    mkdir -p ${outputGroomedParent}/${sessionName}

    # cycle through each dicomdir and do something based on its name:
    for dicomdir in ${inputParentDir}/*; do
       #du -sh ${dicomdir}
       dicomdirBasename=`basename ${dicomdir}`
       #echo $dicomdirBasename
       case "${dicomdirBasename}" in
          MPRAGE_SAGITTAL)
             #du -sh ${inputParentDir}/${dicomdirBasename}
             cp -r ${dicomdir} ${outputGroomedParent}/${sessionName}/anat
             du -sh ${outputGroomedParent}/${sessionName}/anat
          ;;
          RESTING_STATE)
             #du -sh ${inputParentDir}/${dicomdirBasename}
             cp -r ${dicomdir} ${outputGroomedParent}/${sessionName}/fmri.rest.run1
             du -sh ${outputGroomedParent}/${sessionName}/fmri.rest.run1
          ;;
          axial_DANCE1)
             #du -sh ${inputParentDir}/${dicomdirBasename}
             cp -r ${dicomdir} ${outputGroomedParent}/${sessionName}/fmri.taskFT.run1
             du -sh ${outputGroomedParent}/${sessionName}/fmri.taskFT.run1
          ;;
          axial_DANCE2)
             #du -sh ${inputParentDir}/${dicomdirBasename}
             cp -r ${dicomdir} ${outputGroomedParent}/${sessionName}/fmri.taskFT.run2
             du -sh ${outputGroomedParent}/${sessionName}/fmri.taskFT.run2
          ;;
          axial_DANCE3)
             #du -sh ${inputParentDir}/${dicomdirBasename}
             cp -r ${dicomdir} ${outputGroomedParent}/${sessionName}/fmri.taskFT.run3
             du -sh ${outputGroomedParent}/${sessionName}/fmri.taskFT.run3
          ;;
          axial_DANCE4)
             #du -sh ${inputParentDir}/${dicomdirBasename}
             cp -r ${dicomdir} ${outputGroomedParent}/${sessionName}/fmri.taskFT.run4
             du -sh ${outputGroomedParent}/${sessionName}/fmri.taskFT.run4
          ;;
       esac
    done
}

fxnIsGroomedSessionComplete(){
    for dicomdir in anat fmri.rest.run1 fmri.taskFT.run1 fmri.taskFT.run2 fmri.taskFT.run3 fmri.taskFT.run4; do
       du -sh ${outputGroomedParent}/${sessionName}/${dicomdir}
    done
}

# parent directory that will receive the approved and renamed dicomdirs:
outputGroomedParent=/data/tmpHackney/exportedFromDicomStore/groomedForNiftiConversion

# run for a single session:
#sessionName=omt001s01
#fxnGroomOneSession

# loop across multiple sessions:
for sessionName in `basename /data/tmpHackney/exportedFromDicomStore/fixedSessionName/*`; do
   #fxnGroomOneSession $sessionName
   fxnIsGroomedSessionComplete $sessionName
done
