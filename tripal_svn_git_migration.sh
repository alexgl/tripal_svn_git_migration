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

#cd ../tripal
#git remote add tripal-7.x-trunk git:../tripal_branches/tripal-7.x-trunk 
#
#git fetch rweb


