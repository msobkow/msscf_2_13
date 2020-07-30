#!/bin/bash
buildString=$1
toolsetNames="$2 $3 $4 $5 $6 $7 $8 $9"
cd $MSSCFHOME/msscf_2_13/java/bin
./CFManufactureCode213Java.bash ${buildString} com-github-msobkow-CFBam-3-1-CFBam com-github-msobkow-213-layered+msscf ${toolsetNames}
cd $MSSCFHOME
