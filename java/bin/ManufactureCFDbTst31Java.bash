#!/bin/bash
buildString=$1
toolsetNames="$2 $3 $4 $5 $6 $7 $8 $9"
cd $MSSCFHOME/msscf_2_13/java/bin
./CFManufactureCode213Java.bash ${buildString} com-github-msobkow-CFDbTst-3-1-CFDbTst com-github-msobkow-213-layered ${toolsetNames}
cd $MSSCFHOME
