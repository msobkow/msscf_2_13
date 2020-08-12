#!/bin/bash
cd $MSSCFHOME
pushd cfacc_2_13/cplus
	for ascript in Clean*.bash
	do
		echo "Running ./$ascript ..."
		./$ascript
	done
popd
pushd msscf_2_13/cplus
	for ascript in Clean*.bash
	do
		echo "Running ./$ascript ..."
		./$ascript
	done
popd
pushd cfbam_2_13/cplus
	for ascript in Clean*.bash
	do
		echo "Running ./$ascript ..."
		./$ascript
	done
popd
pushd cfdbtst_2_13/cplus
	for ascript in Clean*.bash
	do
		echo "Running ./$ascript ..."
		./$ascript
	done
popd
pushd cfcrm_2_13/cplus
	for ascript in Clean*.bash
	do
		echo "Running ./$ascript ..."
		./$ascript
	done
popd
pushd cfint_2_13/cplus
	for ascript in Clean*.bash
	do
		echo "Running ./$ascript ..."
		./$ascript
	done
popd
pushd cfsec_2_13/cplus
	for ascript in Clean*.bash
	do
		echo "Running ./$ascript ..."
		./$ascript
	done
popd
pushd cfcore_2_13/cplus
	for ascript in Clean*.bash
	do
		echo "Running ./$ascript ..."
		./$ascript
	done
popd
pushd cflib_2_13/cplus
	for ascript in Clean*.bash
	do
		echo "Running ./$ascript ..."
		./$ascript
	done
popd
sudo rm -R /usr/include/msobkow/2.0.13/*
sudo rm -R /usr/share/msobkow/2.0.13/xsd/*
sudo rm /usr/bin/msobkow/2.0.13/*
sudo rm /usr/lib/libcf*.la
sudo rm /usr/lib/libcf*.so
sudo rm /usr/lib/libcf*.so.2
#sudo rm /usr/lib/libcf*.so.2.0
sudo rm /usr/lib/libcf*.so.2.0.13
sudo ldconfig
cd $MSSCFHOME
