#!/bin/bash
cd $MSSCFHOME
pushd cfacc_3_1/java
ant clean
popd
pushd cffrsw_3_1/java
ant clean
popd
pushd cfast_3_1/java
ant clean
popd
pushd msscf_3_1/java
ant clean
popd
pushd cfbam_3_1/java
ant clean
popd
pushd cfdbtst_3_1/java
ant clean
popd
pushd cfcrm_3_1/java
ant clean
popd
pushd cfint_3_1/java
ant clean
popd
pushd cfsec_3_1/java
ant clean
popd
pushd cfcore_3_1/java
ant clean
popd
pushd cflib_3_1/java
ant clean
popd

cd $MSSCFHOME
