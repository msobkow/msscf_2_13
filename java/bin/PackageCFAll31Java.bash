#!/bin/bash
cd $MSSCFHOME
pushd cflib_3_1/java
./Pack* $*
popd
pushd cfcore_3_1/java
./Pack* $*
popd
pushd cfsec_3_1/java
./Pack* $*
popd
pushd cfint_3_1/java
./Pack* $*
popd
pushd cfcrm_3_1/java
./Pack* $*
popd
pushd cfdbtst_3_1/java
./Pack* $*
popd
pushd cfbam_3_1/java
./Pack* $*
popd
pushd msscf_3_1/java
./Pack* $*
popd
pushd cfacc_3_1/java
./Pack* $*
popd
cd $MSSCFHOME
