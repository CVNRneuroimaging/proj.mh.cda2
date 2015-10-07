# Thresholds for 2015 October group-level screenshots

In general: group-level screenshots were constructed using liberal thresholds for the sake of first-pass exploratory visualization.


## EG vs baseline

Thresholded for whole-brain FDR q < 0.05.

```
HOArlegPre.EG voxelwise t > 4.177
TGTrlegPre.EG voxelwise t > 4.042
TGTllegPre.EG voxelwise t > 3.501
```


## IG vs baseline: 

Kept same t-stat threshold as EG vs baseline.

```
HOArlegPre.IG voxelwise t > 4.177 from EG vs baseline
TGTrlegPre.IG voxelwise t > 4.042 from EG vs baseline
TGTllegPre.IG voxelwise t > 3.501 from EG vs baseline
```


## EG minus IG:

Initially thresholded for whole-brain FDR q < 0.05. That only produced surviving clusters in one of the three group-level tests (TGTrlegPre), so for the sake of visual inspection the other two group-level tests have screenshots that reflect arbitrary voxelwise t > 4.0.

```
HOArlegPre.EGminusIG voxelwise t > 4.000, FDR q = 0.67 (whole-brain level: non-significant)
TGTrlegPre.EGminusIG voxelwise t > 4.968, FDR q = 0.05 (whole-brain level: significant)
TGTllegPre.EGminusIG voxelwise t > 4.000, FDR q = 0.32 (whole-brian level: non-significant)
```
