#!/bin/bash

# Use optiBET.sh to skull-strip parallel sessions.

# example dir structure:
# When whole-head anatomic has file and path naming like this:
# /data/panolocal/processedOnPano-hackney/derivedData/omt001s01/omt001s01.anat.nii.gz
# ...then $niftiDirProject should be set to /data/panolocal/processedOnPano-hackney/derivedData
# so that it is easy for gnuParallel to iterate over sessionNames like "omt001s01"


parallelSkullstrips=12
niftiDirProject=/data/panolocal/processedOnPano-hackney/derivedData
#niftiDirProject=$1

echo ""
echo "###################################################################"
echo "Launching parallel executions of 03.3.optiBET-singleSession.sh "
echo ""
echo "parallelSkullstrips: $parallelSkullstrips"
echo "niftiDirProject:     $niftiDirProject"      
echo "###################################################################"
echo ""

# execute for everyone:
#ls -d ${niftiDirProject}/* | parallel --jobs ${parallelSkullstrips} --tag --line-buffer ./03.3.optiBET-singleSession.sh {}

# execute just for sessions imported 20151004:
. 00.projectEnvironment.sh #...to get $sessionsOctImport
rm /tmp/sessionsOct.txt
for session in ${sessionsOctImport}; do
   echo "${niftiDirProject}/${session}" >> /tmp/sessionsOct.txt
done
cat /tmp/sessionsOct.txt | parallel --jobs ${parallelSkullstrips} --tag --line-buffer ./03.3.optiBET-singleSession.sh {}

