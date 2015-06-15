#!/bin/bash
#
# (Re-)populate nitest-freesurfer/derivative directory with files derived
# from FreeSurfer-packaged files
#
# Written for nibabel project
# 2015 Christopher J Markiewicz

# Set up FreeSurfer environment
if [ -z "$FREESURFER_HOME" ]; then
    echo FreeSurfer not detected on this system. Please set FREESURFER_HOME.
    exit 1
fi
FS_FREESURFERENV_NO_OUTPUT=1
. $FREESURFER_HOME/FreeSurferEnv.sh

# Run from nitest-freesurfer
pushd $(dirname `dirname $0`) > /dev/null


#
# Write any conversion functions here.
#

# Create .nii surface file to test ico7 shape handling
mri_convert fsaverage/surf/lh.orig.avg.area.mgh \
    derivative/fsaverage/surf/lh.orig.avg.area.nii


#
# Cleanup
#

# Return to previous previous directory
popd > /dev/null
