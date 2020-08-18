#!/bin/bash
cd $MSSCFHOME
for aprojdir in \
	msscf_2_13/java/org.msscf.msscf.v2_13.CFCli \
	cfbam_2_13/java/org.msscf.msscf.v2_13.cfbamcust.CFBamXmlLoader \
	cfbam_2_13/java/org.msscf.msscf.v2_13.cfbamcust.MSSBamCF \
	cfbam_2_13/java/org.msscf.msscf.v2_13.cfbam.CFBamMssCF \
	cfbam_2_13/java/org.msscf.msscf.v2_13.cfbam.CFBamRam \
	cfbam_2_13/java/org.msscf.msscf.v2_13.cfbam.CFBamSaxLoader \
	cfbam_2_13/java/org.msscf.msscf.v2_13.cfbam \
	cfint_2_13/java/org.msscf.msscf.v2_13.cfint.CFIntRam \
	cfint_2_13/java/org.msscf.msscf.v2_13.cfint.CFIntSaxLoader \
	cfint_2_13/java/org.msscf.msscf.v2_13.cfint \
	cfsec_2_13/java/org.msscf.msscf.v2_13.cfsec.CFSecRam \
	cfsec_2_13/java/org.msscf.msscf.v2_13.cfsec.CFSecSaxLoader \
	cfsec_2_13/java/org.msscf.msscf.v2_13.cfsec \
	cfcore_2_13/java/org.msscf.msscf.v2_13.cfcore \
	cflib_2_13/java/org.msscf.msscf.v2_13.cflib.CFLib.JavaFX \
	cflib_2_13/java/org.msscf.msscf.v2_13.cflib.CFLib
do
	if [ -a ${aprojdir}/pom.xml ]; then
		pushd ${aprojdir}
			mvn clean
		popd
	fi
done
cd $MSSCFHOME
