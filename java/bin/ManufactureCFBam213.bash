#!/bin/bash
cd $MSSCFHOME/msscf_2_12/java/bin
buildString=$1
toolsetNames="$2 $3 $4 $5 $6 $7 $8 $9"
./CFManufactureCode212.bash ${buildString} org-msscf-msscf-CFBam-2-13-CFBam com-github-msobkow-212-layered+msscf ${toolsetNames}
cd $MSSCFHOME