#!/bin/bash
cd $MSSCFHOME
#pushd cfkbase_2_13/java
#ant clean
#popd
pushd msscf_2_13/java
ant clean
popd
pushd cfbam_2_13/java
ant clean
popd
pushd cfint_2_13/java
ant clean
popd
pushd cfsec_2_13/java
ant clean
popd
pushd cfcore_2_13/java
ant clean
popd
pushd cflib_2_13/java
ant clean
popd

cd $MSSCFHOME
