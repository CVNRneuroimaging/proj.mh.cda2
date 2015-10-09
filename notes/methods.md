# Single-session methodology notes

# 1. T1 anatomic was skull-stripped.

FSL's `bet` was used to skull-strip each T1 anatomic. Later steps in the analysis will use this brain mask to help exclude non-brain voxels from analysis.

# 2. Original FMRI runs were motion-corrected and denoised.

FSL's MELODIC was used to apply motion correction and find ICA-detectable components in each FMRI run.

Those ICA components were then input to FSL's FIX in order to classify some of those components as noise, and remove those noise components to produce a denoised version of each FMRI run.

These FIX-denoised versions of each FMRI run were promoted for further analysis, all of which was performed in AFNI (`afni_proc.py`).

# 3. Warm-up TRs were removed.

The first two recorded TRs from each run were discarded.

# 4. Outlier TRs were censored.

TRs were censored if more than 10% of voxels in the TR were classified as outliers by AFNI's 3dToutcount.

# 5. Spatial registrations were calculated.

EPI-to-T1 and T1-to-TLRC transformations were calculated.

# 6. Each TR was spatially smoothed.

Applied Gaussian blur of 4 mm FWHM.

# 7. Each voxel's timeseries was scaled.

Within each run, each voxel's time series was scaled to mean of 100, range of [0,200].

# 8. GLM regressor fits were calculated.

Regressors of interest: IG and EG timing modeled as finite impulse responses instead of being convolved with a priori gama responses.

Regressors of non-interest:
- baseline polynomial trends up to and including cubic trends
- six demeaned motion parameters

# 9. Voxelwise AUC was calculated for IG and EG.

For each stimulus class (IG and EG), voxelwise area-under-curve was calculated from the GLM's output impulse response function (IRESP). Voxelwise AUC was then promoted to group-level analysis as a measure of response magnitude related to each stimulus class. (Magnitude as opposed to statistical significance).
