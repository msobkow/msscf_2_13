#!/bin/bash
cd $MSSCFHOME/msscf_2_12/java/bin
./ManufactureCFCore213.bash $*
cd $MSSCFHOME/msscf_2_12/java/bin
./ManufactureCFSec213.bash $*
cd $MSSCFHOME/msscf_2_12/java/bin
./ManufactureCFInt213.bash $*
cd $MSSCFHOME/msscf_2_12/java/bin
./ManufactureCFBam213.bash $*
cd $MSSCFHOME
