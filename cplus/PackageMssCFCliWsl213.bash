#!/bin/bash
Revision=$1
if [ "$Revision" == "" ]; then
	echo "ERROR: Revision (argument 1) not specified" 1>&2
else
	export Revision
	cd $MSSCFHOME/msscf_2_13/cplus
	if [ ! -d ../installer ]; then
		mkdir ../installer
	fi
	chmod 755 ../installer
	ZipFile="../installer/msscf_2_13_${Revision}-GPLv3-wsl-debug-installer.zip"
	export ZipFile
	rm -f ${ZipFile}
	rm -Rf msscf-2.13.${Revision}-wsl
	mkdir msscf-2.13.${Revision}-wsl
	chmod 755 msscf-2.13.${Revision}-wsl
	echo "Preparing msscf-2.13.${Revision}-wsl ..."
	pushd msscf-2.13.${Revision}-wsl
		cp ../gpl-3.0.txt ../LICENSE .
		git log 2>&1 >ChangeLog
		mkdir bin
		chmod 755 bin
		mkdir bin/msobkow
		chmod 755 bin/msobkow
		mkdir bin/msobkow/2.0.13
		chmod 755 bin/msobkow/2.0.13
		cp ../gpl-3.0.txt ../LICENSE bin/msobkow/2.0.13
		chmod 644 bin/msobkow/2.0.13/*
		cp /usr/bin/msobkow/2.0.13/msscf* bin/msobkow/2.0.13
		chmod 755 bin/msobkow/2.0.13/msscf*
		strip bin/msobkow/2.0.13/msscf*
	popd
	echo "Packaging msscf-2.13.${Revision}-wsl ..."
	zip -q9r ${ZipFile} msscf-2.13.${Revision}-wsl
	rm -Rf msscf-2.13.${Revision}-wsl
	echo "Packaged ${ZipFile}"
	ls -l ${ZipFile}
fi
