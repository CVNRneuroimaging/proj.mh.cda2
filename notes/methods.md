# Single-session methodology notes for Fall 2015 analyses

_Work-in-progress: the content here is not yet complete, but it has been checked for accuracy. -ST_

Joe and Madeline both asked for the longest version of methods that I would like to write, from which they can condense for manuscripts as needed.

For each processing step below I have also included output, configurations, and scripts to help Jonathan and Giri connect the products stored on our servers with the code used to create those products. (This is just a supplement to the filepaths and URLs that I have previously provided to Jonathan, Giri, Joe, Madeleine, and Bruce by email and in-person meetings).

Contents
=================

  * [0. FMRI acquisition quality was assessed.](#0-fmri-acquisition-quality-was-assessed)
    * [software citations](#software-citations)
    * [Hayling sentence completion](#hayling-sentence-completion)
    * [Nocera CDA2](#nocera-cda2)
    * [Hackney OMT](#hackney-omt)
  * [1. The skull was removed from each T1 anatomic.](#1-the-skull-was-removed-from-each-t1-anatomic)
    * [software citations](#software-citations-1)
    * [Hayling sentence completion](#hayling-sentence-completion-1)
    * [Nocera CDA2](#nocera-cda2-1)
    * [Hackney OMT](#hackney-omt-1)
  * [2. Acquired FMRI runs were motion-corrected and denoised.](#2-acquired-fmri-runs-were-motion-corrected-and-denoised)
    * [software citations](#software-citations-2)
    * [Hayling sentence completion](#hayling-sentence-completion-2)
    * [Nocera CDA2](#nocera-cda2-2)
    * [Hackney OMT](#hackney-omt-2)
  * [3. afni_proc: Warm-up TRs were removed.](#3-afni_proc-warm-up-trs-were-removed)
    * [Hayling sentence completion](#hayling-sentence-completion-3)
    * [Nocera CDA2](#nocera-cda2-3)
    * [Hackney OMT](#hackney-omt-3)
  * [4. afni_proc: Outlier TRs were censored.](#4-afni_proc-outlier-trs-were-censored)
    * [Hayling sentence completion](#hayling-sentence-completion-4)
    * [Nocera CDA2](#nocera-cda2-4)
    * [Hackney OMT](#hackney-omt-4)
  * [5. afni_proc: Spatial registrations were calculated.](#5-afni_proc-spatial-registrations-were-calculated)
    * [Hayling sentence completion](#hayling-sentence-completion-5)
    * [Nocera CDA2](#nocera-cda2-5)
    * [Hackney OMT](#hackney-omt-5)
  * [6. afni_proc: Each TR was spatially smoothed.](#6-afni_proc-each-tr-was-spatially-smoothed)
    * [Hayling sentence completion](#hayling-sentence-completion-6)
    * [Nocera CDA2](#nocera-cda2-6)
    * [Hackney OMT](#hackney-omt-6)
  * [7. afni_proc: Each voxel's timeseries was scaled.](#7-afni_proc-each-voxels-timeseries-was-scaled)
    * [Hayling sentence completion](#hayling-sentence-completion-7)
    * [Nocera CDA2](#nocera-cda2-7)
    * [Hackney OMT](#hackney-omt-7)
  * [8. afni_proc: GLM regressor fits were calculated.](#8-afni_proc-glm-regressor-fits-were-calculated)
    * [Hayling sentence completion](#hayling-sentence-completion-8)
    * [Nocera CDA2](#nocera-cda2-8)
    * [Hackney OMT](#hackney-omt-8)
  * [9. Voxelwise area under curve (AUC) was calculated for tasks.](#9-voxelwise-area-under-curve-auc-was-calculated-for-tasks)
    * [Hayling sentence completion](#hayling-sentence-completion-9)
    * [Nocera CDA2](#nocera-cda2-9)
    * [Hackney OMT](#hackney-omt-9)

# 0. FMRI acquisition quality was assessed.

The BIRN Human QA tool was used to generate per-FMRI-run quality assessment data formatted as HTML reports. 


## software citations

- https://xwiki.nbirn.org:8443/xwiki/bin/view/Function-BIRN/AutomatedQA
- download: http://www.nitrc.org/projects/bxh_xcede_tools/
- Article for overall FBIRN recommendations:
>Glover, G. H., Mueller, B. A., Turner, J. A., van Erp, T. G. M., Liu, T. T., Greve, D. N., et al. (2012). Function biomedical informatics research network recommendations for prospective multicenter functional MRI studies. Journal of Magnetic Resonance Imaging : JMRI. http://doi.org/10.1002/jmri.23572
- ...as cited in HCP description: "Additionally, each run is processed through the BIRN Human QA tool (Glover et al., 2012) and the HTML report it generates is viewable within the IntraDB as well.":
>Marcus, D. S., Harms, M. P., Snyder, A. Z., Jenkinson, M., Wilson, J. A., Glasser, M. F., et al. (2013). Human Connectome Project informatics: quality control, database services, and data visualization. NeuroImage, 80, 202–219. http://doi.org/10.1016/j.neuroimage.2013.05.077
- This paper has a passing reference to the human QC tool including a screenshot:
>Keator, D. B., Grethe, J. S., Marcus, D., Ozyurt, B., Gadde, S., Murphy, S., et al. (2008). A National Human Neuroimaging Collaboratory Enabled by the Biomedical Informatics Research Network (BIRN). IEEE Transactions on Information Technology in Biomedicine, 12(2), 162–172. http://doi.org/10.1109/TITB.2008.917893
- reference for the phantom version of the QC report: 
>Friedman, L., & Glover, G. H. (2006). Report on a multicenter fMRI quality assurance protocol. Journal of Magnetic Resonance Imaging : JMRI, 23(6), 827–839. http://doi.org/10.1002/jmri.20583

## Hayling sentence completion
- outputs: 
- scripts: 

## Nocera CDA2
- outputs:
   - bxh files: `hippoback:/data/backup/Atlanta/stowlerWIP/sharedReadOnly/processedOnPano-nocera/derivedData/cda???p??/bxh+fslNifti*`
   - qc reports: `hippoback:/data/backup/Atlanta/stowlerWIP/sharedReadOnly/processedOnPano-nocera/derivedData/cda???p??/qcReport-*`
- scripts:
   - https://github.com/CVNRneuroimaging/proj.jn.cda2/blob/master/04.1.qc-taskCMG-singleSession.sh
   - https://github.com/CVNRneuroimaging/proj.jn.cda2/blob/master/04.2.qc-taskCMG-parallelSessions.sh
   - https://github.com/CVNRneuroimaging/proj.jn.cda2/blob/master/05.1.qc-rest-singleSession.sh
   - https://github.com/CVNRneuroimaging/proj.jn.cda2/blob/master/05.2.qc-rest-parallelSessions.sh

## Hackney OMT
- outputs:
   - bxh files: `hippoback:/data/backup/Atlanta/stowlerWIP/sharedReadOnly/processedOnPano-hackney/derivedData/omt???s??/bxh+fslNifti`
   - qc reports: `hippoback:/data/backup/Atlanta/stowlerWIP/sharedReadOnly/processedOnPano-hackney/derivedData/omt???s??/qcReport-FBIRN-*`
- scripts: 
   - https://github.com/CVNRneuroimaging/proj.mh.cda2/blob/master/04.1.qc-taskFT-singleSession.sh
   - https://github.com/CVNRneuroimaging/proj.mh.cda2/blob/master/04.2.qc-taskFT-parallelSessions.sh
   - https://github.com/CVNRneuroimaging/proj.mh.cda2/blob/master/05.1.qc-rest-singleSession.sh
   - https://github.com/CVNRneuroimaging/proj.mh.cda2/blob/master/05.2.qc-rest-parallelSessions.sh




# 1. The skull was removed from each T1 anatomic.

The FSL `bet` command was used to remove the skull from each T1 anatomic. Later steps in the analysis use the resulting brain mask to exclude non-brain voxels from analysis.

## software citations

Smith, S. M. (2002). Fast robust automated brain extraction. Human Brain Mapping, 17(3), 143–155. http://doi.org/10.1002/hbm.10062

## Hayling sentence completion
- outputs: 
- scripts: 
- bet options: 
- centers of gravity:
- centers of gravity screenshots:

## Nocera CDA2
- outputs: 
   - `hippoback:/data/backup/Atlanta/stowlerWIP/sharedReadOnly/processedOnPano-nocera/derivedData/cda*/*anat_brain*.nii.gz`
- scripts: 
   - https://github.com/CVNRneuroimaging/proj.jn.cda2/blob/master/03.1.skullStrip-singleSession.sh
   - https://github.com/CVNRneuroimaging/proj.jn.cda2/blob/master/03.2.skullStrip-parallelSessions.sh
   - https://github.com/stowler/brainwhere/blob/master/bwSkullStrip-singleSession.sh
   - https://github.com/stowler/brainwhere/blob/master/bwSkullStrip-parallelSessions.sh
- bet options: 
   - `-f .3 -c ${cog} -B -v`
- centers of gravity: 
   - https://github.com/CVNRneuroimaging/proj.jn.cda2/tree/master/t1anat-manualCOG
- centers of gravity screenshots: 
   - `hippoback:/data/backup/Atlanta/stowlerWIP/sharedReadOnly/processedOnPano-nocera/derivedData/cda???p??/*anat*Ortho_view_.png`

## Hackney OMT
- outputs:
   - `hippoback:/data/backup/Atlanta/stowlerWIP/sharedReadOnly/processedOnPano-hackney/derivedData/omt???s??/*anat_brain*.nii.gz`
- scripts:
   - https://github.com/CVNRneuroimaging/proj.mh.cda2/blob/master/03.1.skullStrip-singleSession.sh
   - https://github.com/CVNRneuroimaging/proj.mh.cda2/blob/master/03.2.skullStrip-parallelSessions.sh
   - https://github.com/stowler/brainwhere/blob/master/bwSkullStrip-singleSession.sh
   - https://github.com/stowler/brainwhere/blob/master/bwSkullStrip-parallelSessions.sh
- bet options: 
   - `-f .3 -c ${cog} -B -v`
- centers of gravity:
   - https://github.com/CVNRneuroimaging/proj.mh.cda2/tree/master/t1anat-manualCOG
- centers of gravity screenshots:
   - `hippoback:/data/backup/Atlanta/stowlerWIP/sharedReadOnly/processedOnPano-hackney/derivedData/omt???s??/*anat*Ortho_view_.png`


# 2. Acquired FMRI runs were motion-corrected and denoised.

FSL's MELODIC was used to apply motion correction and find ICA-detectable components in each FMRI run.

Those ICA components were then input to FSL's FIX in order to classify some of those components as noise, and remove those noise components to produce a denoised version of each FMRI run.

These FIX-denoised versions of each FMRI run were promoted for further analysis, all of which was performed in AFNI (`afni_proc.py`).

## software citations

- FSL MELODIC: 
>Beckmann, C. F., & Smith, S. M. (2004). Probabilistic Independent Component Analysis for Functional Magnetic Resonance Imaging. IEEE Transactions on Medical Imaging, 23(2), 137–152. http://doi.org/10.1109/TMI.2003.822821

- FSL FIX: please cite both of these papers per the [FIX web page](http://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FIX):
   - >Griffanti, L., Salimi-Khorshidi, G., Beckmann, C. F., Auerbach, E. J., Douaud, G., Sexton, C. E., et al. (2014). ICA-based artefact removal and accelerated fMRI acquisition for improved resting state network imaging. NeuroImage, 95, 232–247. http://doi.org/10.1016/j.neuroimage.2014.03.034
   - >Salimi-Khorshidi, G., Douaud, G., Beckmann, C. F., Glasser, M. F., Griffanti, L., & Smith, S. M. (2014). Automatic denoising of functional MRI data: combining independent component analysis and hierarchical fusion of classifiers. NeuroImage, 90, 449–468. http://doi.org/10.1016/j.neuroimage.2013.11.046


## Hayling sentence completion
- outputs from single-run MELODIC: 
- scripts: 
- MELODIC config files:
- FIX system-wide config:
   - https://github.com/CVNRneuroimaging/proj.jn.cda2/tree/master/config-FIX

## Nocera CDA2
- outputs from single-run MELODIC:
   - `hippoback:/data/backup/Atlanta/stowlerWIP/sharedReadOnly/processedOnPano-nocera/derivedData/cda???p??/*melodicFixNone.ica`
- outputs from FIX:
   - `hippoback:/data/backup/Atlanta/stowlerWIP/sharedReadOnly/processedOnPano-nocera/derivedData/cda???p??/*Fix*Standard*.ica`
- scripts:
   - https://github.com/CVNRneuroimaging/proj.jn.cda2/blob/master/06.melodic-taskCMG-generateFsfVariants.sh
   - https://github.com/CVNRneuroimaging/proj.jn.cda2/blob/master/07.melodic-rest-generateFsfVariants.sh
   - https://github.com/CVNRneuroimaging/proj.jn.cda2/blob/master/08.1.fix-singleRun.sh
   - https://github.com/CVNRneuroimaging/proj.jn.cda2/blob/master/08.2.fix-taskCMG-parallelRuns.sh
   - https://github.com/CVNRneuroimaging/proj.jn.cda2/blob/master/08.3.fix-rest-parallelRuns.sh
- MELODIC config files:
   - https://github.com/CVNRneuroimaging/proj.jn.cda2/tree/master/melodic-fsfFiles-rest
   - https://github.com/CVNRneuroimaging/proj.jn.cda2/tree/master/melodic-fsfFiles-taskCMG
- FIX system-wide config:
   - https://github.com/CVNRneuroimaging/proj.jn.cda2/tree/master/config-FIX

## Hackney OMT
- outputs from single-run MELODIC:
   - `hippoback:/data/backup/Atlanta/stowlerWIP/sharedReadOnly/processedOnPano-hackney/derivedData/omt???s??/*melodicFixNone.ica`
- outputs from FIX:
   - `hippoback:/data/backup/Atlanta/stowlerWIP/sharedReadOnly/processedOnPano-hackney/derivedData/omt???s??/*Fix*Standard*.ica`
- scripts: 
   - https://github.com/CVNRneuroimaging/proj.mh.cda2/blob/master/06.melodic-taskFT-generateFsfVariants.sh
   - https://github.com/CVNRneuroimaging/proj.mh.cda2/blob/master/07.melodic-rest-generateFsfVariants.sh
   - https://github.com/CVNRneuroimaging/proj.mh.cda2/blob/master/08.1.fix-singleRun.sh
   - https://github.com/CVNRneuroimaging/proj.mh.cda2/blob/master/08.2.fix-taskFT-parallelRuns.sh
   - https://github.com/CVNRneuroimaging/proj.mh.cda2/blob/master/08.3.fix-rest-parallelRuns.sh
- MELODIC config files:
   - https://github.com/CVNRneuroimaging/proj.mh.cda2/tree/master/melodic-fsfFiles-rest
   - https://github.com/CVNRneuroimaging/proj.mh.cda2/tree/master/melodic-fsfFiles-taskFT
- FIX system-wide config:
   - https://github.com/CVNRneuroimaging/proj.jn.cda2/tree/master/config-FIX



# 3. afni_proc: Warm-up TRs were removed.

## Hayling sentence completion
N/A: Stephen wasn't tasked with GLM for Fall 2015 analyses.

## Nocera CDA2
N/A: Stephen wasn't tasked with GLM for Fall 2015 analyses.

## Hackney OMT
The first two recorded TRs from each run were discarded.



# 4. afni_proc: Outlier TRs were censored.

## Hayling sentence completion
N/A: Stephen wasn't tasked with GLM for Fall 2015 analyses.

## Nocera CDA2
N/A: Stephen wasn't tasked with GLM for Fall 2015 analyses.

## Hackney OMT
TRs were censored if more than 10% of voxels in the TR were classified as outliers by AFNI's 3dToutcount.



# 5. afni_proc: Spatial registrations were calculated.

## Hayling sentence completion
N/A: Stephen wasn't tasked with GLM for Fall 2015 analyses.

## Nocera CDA2
N/A: Stephen wasn't tasked with GLM for Fall 2015 analyses.

## Hackney OMT
EPI-to-T1 and T1-to-TLRC transformations were calculated.



# 6. afni_proc: Each TR was spatially smoothed.

## Hayling sentence completion
N/A: Stephen wasn't tasked with GLM for Fall 2015 analyses.

## Nocera CDA2
N/A: Stephen wasn't tasked with GLM for Fall 2015 analyses.

## Hackney OMT
Applied Gaussian blur of 4 mm FWHM.



# 7. afni_proc: Each voxel's timeseries was scaled.

## Hayling sentence completion
N/A: Stephen wasn't tasked with GLM for Fall 2015 analyses.

## Nocera CDA2
N/A: Stephen wasn't tasked with GLM for Fall 2015 analyses.

## Hackney OMT
Within each run, each voxel's time series was scaled to mean of 100, range of [0,200].



# 8. afni_proc: GLM regressor fits were calculated.

## Hayling sentence completion
N/A: Stephen wasn't tasked with GLM for Fall 2015 analyses.

## Nocera CDA2
N/A: Stephen wasn't tasked with GLM for Fall 2015 analyses.

## Hackney OMT
Regressors of interest: IG and EG timing modeled as finite impulse responses instead of being convolved with a priori gama responses.

Regressors of non-interest:
- baseline polynomial trends up to and including cubic trends
- six demeaned motion parameters



# 9. Voxelwise area under curve (AUC) was calculated for tasks.

## Hayling sentence completion
N/A: Stephen wasn't tasked with GLM for Fall 2015 analyses.

## Nocera CDA2
N/A: Stephen wasn't tasked with GLM for Fall 2015 analyses.

## Hackney OMT
For each stimulus class (IG and EG), voxelwise area-under-curve was calculated from the GLM's output impulse response function (IRESP). Voxelwise AUC was then promoted to group-level analysis as a measure of response magnitude related to each stimulus class. (Magnitude as opposed to statistical significance).
