#!/bin/bash
cd $MSSCFHOME
pushd cflib_2_13/java
./Pack* $*
popd
pushd cfcore_2_13/java
./Pack* $*
popd
pushd cfsec_2_13/java
./Pack* $*
popd
pushd cfint_2_13/java
./Pack* $*
popd
pushd cfcrm_2_13/java
./Pack* $*
popd
pushd cfdbtst_2_13/java
./Pack* $*
popd
pushd cfbam_2_13/java
./Pack* $*
popd
pushd msscf_2_13/java
./Pack* $*
popd
#pushd cfkbase_2_13/java
#./Pack* $*
#popd
pushd cfacc_2_13/java
./Pack* $*
popd
cd $MSSCFHOME
