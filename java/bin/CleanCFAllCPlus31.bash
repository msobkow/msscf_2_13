#!/bin/bash
cd $MSSCFHOME
pushd cfacc_3_1/cplus
	for ascript in Clean*.bash
	do
		echo "Running ./$ascript ..."
		./$ascript
	done
popd
pushd msscf_3_1/cplus
	for ascript in Clean*.bash
	do
		echo "Running ./$ascript ..."
		./$ascript
	done
popd
pushd cfbam_3_1/cplus
	for ascript in Clean*.bash
	do
		echo "Running ./$ascript ..."
		./$ascript
	done
popd
pushd cfdbtst_3_1/cplus
	for ascript in Clean*.bash
	do
		echo "Running ./$ascript ..."
		./$ascript
	done
popd
pushd cfcrm_3_1/cplus
	for ascript in Clean*.bash
	do
		echo "Running ./$ascript ..."
		./$ascript
	done
popd
pushd cfint_3_1/cplus
	for ascript in Clean*.bash
	do
		echo "Running ./$ascript ..."
		./$ascript
	done
popd
pushd cfsec_3_1/cplus
	for ascript in Clean*.bash
	do
		echo "Running ./$ascript ..."
		./$ascript
	done
popd
pushd cfcore_3_1/cplus
	for ascript in Clean*.bash
	do
		echo "Running ./$ascript ..."
		./$ascript
	done
popd
pushd cflib_3_1/cplus
	for ascript in Clean*.bash
	do
		echo "Running ./$ascript ..."
		./$ascript
	done
popd
sudo rm -R /usr/include/msscf/3.0.1/*
sudo rm -R /usr/share/msscf/3.0.1/xsd/*
sudo rm /usr/bin/msscf/3.0.1/*
sudo rm /usr/lib/libcf*.la
sudo rm /usr/lib/libcf*.so
sudo rm /usr/lib/libcf*.so.2
#sudo rm /usr/lib/libcf*.so.2.0
sudo rm /usr/lib/libcf*.so.3.0.1
sudo ldconfig
cd $MSSCFHOME
