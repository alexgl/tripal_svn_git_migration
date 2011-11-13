#!/bin/bash
#usage create users.txt file with all the user credentials ie " svnusername = gitdesirednick <yourdrupalorg_email> "

mkdir tripal
cd tripal
git svn init https://gmod.svn.sourceforge.net/svnroot/gmod/tripal/trunk --no-metadata
git config svn.authorsfile ../../users.txt
git svn fetch
echo "got tripal trunk"

cd ../
mkdir tripal_tags
cd tripal_tags
git svn init https://gmod.svn.sourceforge.net/svnroot/gmod/tripal/tags --no-metadata
git config svn.authorsfile ../../users.txt
git svn fetch
echo "got tripal tags"

cd ../
mkdir tripal_branches
cd tripal_branches
git svn init https://gmod.svn.sourceforge.net/svnroot/gmod/tripal/branches --no-metadata
git config svn.authorsfile ../../users.txt
git svn fetch
#git checkout -b to_merge_tripal
#mkdir ready_for_d7
#git mv -r tripal-7.x-trunk/* ./ready_for_d7/ #this is because some previously untracked files make way into this branch from master
#rm -r tripal-7.x-trunk
#git add .
#git commit -am'commit to merge branch'
echo "got tripal branches"

cd ../tripal
git remote add tripal_d7_repo ../tripal_branches/ 
git fetch tripal_d7_repo
#git branch tripal_d7 tripal_d7_repo/to_merge_tripal
git branch tripal_d7 tripal_d7_repo/master
git remote add tripal_svn_tags ../tripal_tags/
git fetch tripal_svn_tags
git branch svn_tags tripal_svn_tags/master
echo "merged tripal branches and tags with master"

