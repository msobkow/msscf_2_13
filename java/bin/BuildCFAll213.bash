#!/bin/bash
cd $MSSCFHOME
pushd cflib_2_13/java
ant
popd
pushd cfcore_2_13/java
ant
popd
pushd cfsec_2_13/java
ant
popd
pushd cfint_2_13/java
ant
popd
pushd cfcrm_2_13/java
ant
popd
pushd cfdbtst_2_13/java
ant
popd
pushd cfbam_2_13/java
ant
popd
pushd msscf_2_13/java
ant
popd
#pushd kbase_2_13/java
#ant
#popd
pushd cfast_2_13/java
ant
popd
pushd cffrsw_2_13/java
ant
popd
pushd cfacc_2_13/java
ant
popd
cd $MSSCFHOME
