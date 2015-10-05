#!/bin/sh

################################################################################
# This script uses AFNI's afni_proc.py command to launch modern single-session
# preprocessing and analysis. To launch your analysis and review results:
# 
# 1. Execute this afni_proc script with "bash [thisScriptName]" (no quotes or
#    square brackets)
# 2. Execute the resulting proc.* script using the directions printed at the
#    end of step one's output (e.g., "tcsh -xef proc.exampleParticipant |& tee output.proc.exampleParticipant")
# 3. After the script completes, look for errors with "less output.proc.exampleParticipant")
# 4. cd to the results directory and review your results by 
################################################################################


# NOTE: the voice prompt stim_times format provided by MH had to be converted
# to stim_file format (i.e., column of 1's and 0's) because AFNI won't accept
# stim_times format for regressors of non-interest:

#    timing_tool.py \
#    -timing <name of exisiting stim_times file> \
#    -timing_to_1D <name of stim_file file to be created> \
#    -tr <output's time resolution in seconds> \
#    -stim_dur 3 <stimulus duration in seconds> \
#    -run_len <run duration in seconds>

# ...which looks like this for MH's 3 s (== 1 TR) voice prompts in her runs of
# 112 TRs (112 TRs == 114 transfered TRs minus 2 warm-up TRs):
#
#    timing_tool.py \
#    -timing VoiceRegressors_OMT997pilot1_stim_timing.txt \
#    -timing_to_1D voicePrompt_OMT997pilot1_stim_file.1D \
#    -tr 3 \
#    -stim_dur 3 \
#    -run_len 336


# NOTE: this combination of regressors does produce a non-fatal correlation warning:
#
#    ----------- correlation warnings -----------
#    
#    Warnings regarding Correlation Matrix: X.xmat.1D
#    
#      severity   correlation   cosine  regressor pair
#        --------   -----------   ------  ----------------------------------------
#          medium:       0.414       0.397  (23 vs. 24)  EG#3  vs.  voice#0



#########################################################
# VARIABLE DEFINITIONS:
#########################################################

# Define variables to be used in this script's call to afni_proc. These values
# could also be given directly to afni_proc, but storing them in variables
# first makes your afni_proc command more readable.
session=$1

# Group for naming parent dir of outputs, e.g.,
#     HOArlegPre
#     TGTrlegPre
#     TGTllegPre
group=$2

# source environment script to get participant lists such as ${sessionsTypicalHOArlegPre}:
. ./00.projectEnvironment.sh
#echo $scriptDir
#echo $projDir


# EPI timeseries to be used as afni_proc inputs. AFNI needs these to have unique file names:
rm -f /tmp/${session}.fmri.taskFT.run*.melodicFixStandard15-filtered_func_data_clean.nii.gz
for run in 1 2 3 4; do
   cp ${projDir}/derivedData/${session}/${session}.fmri.taskFT.run${run}.melodicFixStandard15-gnuParallel10.ica/filtered_func_data_clean.nii.gz \
   /tmp/${session}.fmri.taskFT.run${run}.melodicFixStandard15-filtered_func_data_clean.nii.gz
done
acqfiles="/tmp/${session}.fmri.taskFT.run*.melodicFixStandard15-filtered_func_data_clean.nii.gz"

# Anatomic T1 (skull-stripped) to be used as an afni_proc input:
anatWithoutSkull="${projDir}/derivedData/${session}/${session}.anat_brain.nii.gz"

# Number of warm-up TRs that were collected at the start of each run:
disdacqs=2

# Stimulus timing files detailing task timing:
stimTimesEG="${scriptDir}/regressors-taskTiming/EG_${session}_*.txt"
stimTimesIG="${scriptDir}/regressors-taskTiming/IG_${session}_*.txt"

# ...session identifier to be used in output filenames:
sessionID="${session}.onsetsBlock.basisTent12.includesContrast"


#########################################################
# afni_proc.py command and explanations:
#########################################################

# Here is the afni_proc.py command executed for this analysis, and below that
# command is an explanation of the command arguments (subcommands):

# for right-leg HOAs, which didn't have any atypical sessions:
#mkdir ~/temp/apDir_${sessionID}
#cd ~/temp/apDir_${sessionID}

# for right-leg target participants, who did have atypical sessions:
mkdir -p ~/temp.${group}/apDir_${sessionID}
cd       ~/temp.${group}/apDir_${sessionID}

afni_proc.py \
-subj_id ${sessionID} \
-script proc.${sessionID} \
-out_dir results.${sessionID} \
-dsets ${acqfiles} \
-do_block align tlrc \
-copy_anat ${anatWithoutSkull} \
-anat_has_skull no \
-tcat_remove_first_trs ${disdacqs} \
-volreg_align_to first \
-volreg_align_e2a \
-volreg_tlrc_warp \
-volreg_interp -Fourier \
-blur_size 4 \
-regress_stim_times ${stimTimesIG} ${stimTimesEG} \
-regress_stim_labels IG EG \
-regress_basis 'TENT(0,12,4)' \
-regress_apply_mot_types demean \
-regress_censor_motion 0.3 \
-regress_censor_outliers 0.1 \
-regress_compute_fitts \
-regress_opts_3dD -fout -rout -nobout -jobs 8 \
-gltsym 'SYM: +EG -IG' \
-glt_label 1 EG_vs_IG \
-regress_run_clustsim yes \
-regress_est_blur_epits \
-regress_est_blur_errts \
-regress_reml_exec


