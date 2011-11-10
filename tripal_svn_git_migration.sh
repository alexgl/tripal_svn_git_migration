#!/bin/bash

mkdir tripal
cd tripal
git svn init https://gmod.svn.sourceforge.net/svnroot/gmod/tripal/trunk --no-metadata
git config svn.authorsfile ../../users.txt
git svn fetch

cd ../
mkdir tripal_tags
git svn init https://gmod.svn.sourceforge.net/svnroot/gmod/tripal/tags --no-metadata
git config svn.authorsfile ../../users.txt
git svn fetch

cd ../
mkdir tripal_branches
git svn init https://gmod.svn.sourceforge.net/svnroot/gmod/tripal/branches --no-metadata
git config svn.authorsfile ../../users.txt
git svn fetch
git checkout -b to_merge_tripal
git mv -r tripal-7.x-trunk/* ./
rm -r tripal-7.x-trunk
git add .
git commit -am'commit to merge branch'


cd ../tripal
git remote add tripal_d7_repo git:../tripal_branches/ 
git fetch tripal_d7_repo
git branch tripal_d7 tripal_d7_repo/to_merge_tripal

#git checkout -b 


