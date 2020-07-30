#!/bin/bash
cd $MSSCFHOME
pushd cflib_2_13/cplus
./Pack* $*
popd
pushd cfcore_2_13/cplus
./Pack* $*
popd
pushd cfsec_2_13/cplus
./Pack* $*
popd
pushd cfint_2_13/cplus
./Pack* $*
popd
pushd cfcrm_2_13/cplus
./Pack* $*
popd
pushd cfdbtst_2_13/cplus
./Pack* $*
popd
pushd cfbam_2_13/cplus
./Pack* $*
popd
pushd msscf_2_13/cplus
./Pack* $*
popd
pushd kbase_2_13
./Pack* $*
popd
pushd cfast_2_13/cplus
./Pack* $*
popd
pushd cffrsw_2_13/cplus
./Pack* $*
popd
pushd cfacc_2_13/cplus
./Pack* $*
popd
cd $MSSCFHOME
