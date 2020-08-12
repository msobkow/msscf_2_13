#!/bin/bash
cd $MSSCFHOME
pushd cflib_3_1
$GIT $*
popd
pushd cfcore_3_1
$GIT $*
popd
pushd cfsec_3_1
$GIT $*
popd
pushd cfint_3_1
$GIT $*
popd
pushd cfcrm_3_1
$GIT $*
popd
pushd cfdbtst_3_1
$GIT $*
popd
pushd cfbam_3_1
$GIT $*
popd
pushd msscf_3_1
$GIT $*
popd
pushd cfacc_3_1
$GIT $*
popd
cd $MSSCFHOME
