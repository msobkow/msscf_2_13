#!/bin/bash
cd $MSSCFHOME
pushd cflib_2_13
$GIT $*
popd
pushd cfcore_2_13
$GIT $*
popd
pushd cfsec_2_13
$GIT $*
popd
pushd cfint_2_13
$GIT $*
popd
pushd cfcrm_2_13
$GIT $*
popd
pushd cfdbtst_2_13
$GIT $*
popd
pushd cfbam_2_13
$GIT $*
popd
pushd msscf_2_13
$GIT $*
popd
pushd cfkbase_2_13
$GIT $*
popd
pushd cfmodel_2_13
$GIT $*
popd
pushd cfacc_2_13
$GIT $*
popd
cd $MSSCFHOME
