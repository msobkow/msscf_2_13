#!/bin/bash
buildString=$1
toolsetNames="$2 $3 $4 $5 $6 $7 $8 $9"
cd $MSSCFHOME/msscf_2_13/java/bin
./CFManufactureCode213Java.bash ${buildString} com-github-msobkow-CFCore-3-1-CFGenKb com-github-msobkow-213-cfengine ${toolsetNames}
cd $MSSCFHOME
