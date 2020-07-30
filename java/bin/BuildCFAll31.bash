#!/bin/bash
cd $MSSCFHOME
pushd cflib_3_1/java
ant
popd
#pushd cfcore_3_1/java
#ant
#popd
pushd cfsec_3_1/java
ant
popd
#pushd cfint_3_1/java
#ant
#popd
#pushd cfcrm_3_1/java
#ant
#popd
#pushd cfdbtst_3_1/java
#ant
#popd
#pushd cfbam_3_1/java
#ant
#popd
#pushd msscf_3_1/java
#ant
#popd
#pushd cfast_3_1/java
#ant
#popd
#pushd cffrsw_3_1/java
#ant
#popd
#pushd cfacc_3_1/java
#ant
#popd
cd $MSSCFHOME
