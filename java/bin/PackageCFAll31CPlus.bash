#!/bin/bash
cd $MSSCFHOME
pushd cflib_3_1/cplus
./Pack* $*
popd
pushd cfcore_3_1/cplus
./Pack* $*
popd
pushd cfsec_3_1/cplus
./Pack* $*
popd
pushd cfint_3_1/cplus
./Pack* $*
popd
pushd cfcrm_3_1/cplus
./Pack* $*
popd
pushd cfdbtst_3_1/cplus
./Pack* $*
popd
pushd cfbam_3_1/cplus
./Pack* $*
popd
pushd msscf_3_1/cplus
./Pack* $*
popd
pushd cfacc_3_1/cplus
./Pack* $*
popd
cd $MSSCFHOME
