#!/bin/bash
cd $MSSCFHOME
pushd cfacc_2_13/java
ant clean
popd
pushd cffrsw_2_13/java
ant clean
popd
pushd cfast_2_13/java
ant clean
popd
#pushd kbase_2_13/java
#ant clean
#popd
pushd msscf_2_13/java
ant clean
popd
pushd cfbam_2_13/java
ant clean
popd
pushd cfdbtst_2_13/java
ant clean
popd
pushd cfcrm_2_13/java
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
