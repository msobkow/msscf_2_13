#!/bin/bash
cd $MSSCFHOME
pushd cflib_2_13
chmod 755 `find . -name '*.bash'`
$GIT add `find . -name '.gitignore' -o -name '*.bash'`
$GIT update-index --add --chmod=+x `find . -name '*.bash'`
popd
pushd cfcore_2_13
chmod 755 `find . -name '*.bash'`
$GIT add `find . -name '.gitignore' -o -name '*.bash'`
$GIT update-index --add --chmod=+x `find . -name '*.bash'`
popd
pushd cfsec_2_13
chmod 755 `find . -name '*.bash'`
$GIT add `find . -name '.gitignore' -o -name '*.bash'`
$GIT update-index --add --chmod=+x `find . -name '*.bash'`
popd
pushd cfint_2_13
chmod 755 `find . -name '*.bash'`
$GIT add `find . -name '.gitignore' -o -name '*.bash'`
$GIT update-index --add --chmod=+x `find . -name '*.bash'`
popd
pushd cfcrm_2_13
chmod 755 `find . -name '*.bash'`
$GIT add `find . -name '.gitignore' -o -name '*.bash'`
$GIT update-index --add --chmod=+x `find . -name '*.bash'`
popd
pushd cfdbtst_2_13
chmod 755 `find . -name '*.bash'`
$GIT add `find . -name '.gitignore' -o -name '*.bash'`
$GIT update-index --add --chmod=+x `find . -name '*.bash'`
popd
pushd cfbam_2_13
chmod 755 `find . -name '*.bash'`
$GIT add `find . -name '.gitignore' -o -name '*.bash'`
$GIT update-index --add --chmod=+x `find . -name '*.bash'`
popd
pushd msscf_2_13
chmod 755 `find . -name '*.bash'`
$GIT add `find . -name '.gitignore' -o -name '*.bash'`
$GIT update-index --add --chmod=+x `find . -name '*.bash'`
popd
pushd cfkbase_2_13
chmod 755 `find . -name '*.bash'`
$GIT add `find . -name '.gitignore' -o -name '*.bash'`
$GIT update-index --add --chmod=+x `find . -name '*.bash'`
popd
pushd cfacc_2_13
chmod 755 `find . -name '*.bash'`
$GIT add `find . -name '.gitignore' -o -name '*.bash'`
$GIT update-index --add --chmod=+x `find . -name '*.bash'`
popd
cd $MSSCFHOME
