#!/bin/bash
cd $MSSCFHOME/msscf_2_13/java/bin
./ManufactureCFCore31Java.bash $*
cd $MSSCFHOME/msscf_2_13/java/bin
./ManufactureCFSec31Java.bash $*
cd $MSSCFHOME/msscf_2_13/java/bin
./ManufactureCFInt31Java.bash $*
cd $MSSCFHOME/msscf_2_13/java/bin
./ManufactureCFCrm31Java.bash $*
cd $MSSCFHOME/msscf_2_13/java/bin
./ManufactureCFDbTst31Java.bash $*
cd $MSSCFHOME/msscf_2_13/java/bin
./ManufactureCFBam31Java.bash $*
cd $MSSCFHOME/msscf_2_13/java/bin
./ManufactureCFAcc31Java.bash $*
cd $MSSCFHOME
