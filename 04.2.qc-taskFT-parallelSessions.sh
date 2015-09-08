#!/bin/sh

parallelQcRuns=20
niftiDirProject=/data/panolocal/processedOnPano-hackney/derivedData

ls -d ${niftiDirProject}/* | parallel --jobs ${parallelQcRuns} --tag --line-buffer ~stowler-local/src.mywork.gitRepos/proj.mh.cda2/04.1.qc-taskFT-singleSession.sh {}
