#!/bin/bash
buildString=$1
toolsetNames="$2 $3 $4 $5 $6 $7 $8 $9"
cd $MSSCFHOME/msscf_2_13/java/bin
./CFManufactureCode213Java.bash ${buildString} com-github-msobkow-CFAcc-3-1-CFAcc com-github-msobkow-213-layered ${toolsetNames}
cd $MSSCFHOME
