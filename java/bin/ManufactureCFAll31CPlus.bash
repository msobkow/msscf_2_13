#!/bin/bash
cd $MSSCFHOME/msscf_2_13/java/bin
./ManufactureCFCore31CPlus.bash $*
cd $MSSCFHOME/msscf_2_13/java/bin
./ManufactureCFSec31CPlus.bash $*
cd $MSSCFHOME/msscf_2_13/java/bin
./ManufactureCFInt31CPlus.bash $*
cd $MSSCFHOME/msscf_2_13/java/bin
./ManufactureCFCrm31CPlus.bash $*
cd $MSSCFHOME/msscf_2_13/java/bin
./ManufactureCFDbTst31CPlus.bash $*
cd $MSSCFHOME/msscf_2_13/java/bin
./ManufactureCFBam31CPlus.bash $*
cd $MSSCFHOME/msscf_2_13/java/bin
./ManufactureCFAcc31CPlus.bash $*
cd $MSSCFHOME
