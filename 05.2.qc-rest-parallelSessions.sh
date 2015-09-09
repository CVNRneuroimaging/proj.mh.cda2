#!/bin/sh

parallelQcRuns=$1
niftiDirProject=/data/panolocal/processedOnPano-hackney/derivedData

ls -d ${niftiDirProject}/* | parallel --jobs ${parallelQcRuns} --tag --line-buffer ~stowler-local/src.mywork.gitRepos/proj.mh.cda2/05.1.qc-rest-singleSession.sh {}
