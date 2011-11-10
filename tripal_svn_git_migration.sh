#!/bin/bash

mkdir tripal
cd tripal
git svn init https://gmod.svn.sourceforge.net/svnroot/gmod/tripal/trunk --no-metadata
git config svn.authorsfile ../../users.txt
git svn fetch

