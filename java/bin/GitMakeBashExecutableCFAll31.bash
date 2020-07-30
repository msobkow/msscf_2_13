#!/bin/bash
cd $MSSCFHOME
pushd cflib_3_1
$GIT add `find . -name '.gitignore' -o -name '*.bash'`
$GIT update-index --add --chmod=+x `find . -name '*.bash'`
popd
#pushd cfcore_3_1
#$GIT add `find . -name '.gitignore' -o -name '*.bash'`
#$GIT update-index --add --chmod=+x `find . -name '*.bash'`
#popd
pushd cfsec_3_1
$GIT add `find . -name '.gitignore' -o -name '*.bash'`
$GIT update-index --add --chmod=+x `find . -name '*.bash'`
popd
pushd cfint_3_1
$GIT add `find . -name '.gitignore' -o -name '*.bash'`
$GIT update-index --add --chmod=+x `find . -name '*.bash'`
popd
pushd cfcrm_3_1
$GIT add `find . -name '.gitignore' -o -name '*.bash'`
$GIT update-index --add --chmod=+x `find . -name '*.bash'`
popd
pushd cfdbtst_3_1
$GIT add `find . -name '.gitignore' -o -name '*.bash'`
$GIT update-index --add --chmod=+x `find . -name '*.bash'`
popd
pushd cfbam_3_1
$GIT add `find . -name '.gitignore' -o -name '*.bash'`
$GIT update-index --add --chmod=+x `find . -name '*.bash'`
popd
pushd msscf_3_1
$GIT add `find . -name '.gitignore' -o -name '*.bash'`
$GIT update-index --add --chmod=+x `find . -name '*.bash'`
popd
pushd cfast_3_1
$GIT add `find . -name '.gitignore' -o -name '*.bash'`
$GIT update-index --add --chmod=+x `find . -name '*.bash'`
popd
pushd cffrsw_3_1
$GIT add `find . -name '.gitignore' -o -name '*.bash'`
$GIT update-index --add --chmod=+x `find . -name '*.bash'`
popd
pushd cfacc_3_1
$GIT add `find . -name '.gitignore' -o -name '*.bash'`
$GIT update-index --add --chmod=+x `find . -name '*.bash'`
popd
cd $MSSCFHOME
