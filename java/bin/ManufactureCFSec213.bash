#!/bin/bash
cd $MSSCFHOME/msscf_2_12/java/bin
buildString=$1
toolsetNames="$2 $3 $4 $5 $6 $7 $8 $9"
./CFManufactureCode212.bash ${buildString} org-msscf-msscf-CFSec-2-13-CFSec com-github-msobkow-212-layered ${toolsetNames}
cd $MSSCFHOME
