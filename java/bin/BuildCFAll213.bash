#!/bin/bash
cd $MSSCFHOME
let MavenStatus=0
for aprojdir in msscforg/java/org.msscf \
	msscforg/java/org.msscf.msscf.v_2_13 \
	cflib_2_13/java/org.msscf.msscf.v2_13.cflib.CFLib \
	cflib_2_13/java/org.msscf.msscf.v2_13.cflib.CFLib.JavaFX \
	cfcore_2_13/java/org.msscf.msscf.v2_13.cfcore \
	cfsec_2_13/java/org.msscf.msscf.v2_13.cfsec \
	cfsec_2_13/java/org.msscf.msscf.v2_13.cfsec.CFSecSaxLoader \
	cfsec_2_13/java/org.msscf.msscf.v2_13.cfsec.CFSecRam \
	cfint_2_13/java/org.msscf.msscf.v2_13.cfint \
	cfint_2_13/java/org.msscf.msscf.v2_13.cfint.CFIntSaxLoader \
	cfint_2_13/java/org.msscf.msscf.v2_13.cfint.CFIntRam \
	cfbam_2_13/java/org.msscf.msscf.v2_13.cfbam \
	cfbam_2_13/java/org.msscf.msscf.v2_13.cfbam.CFBamSaxLoader \
	cfbam_2_13/java/org.msscf.msscf.v2_13.cfbam.CFBamRam \
	cfbam_2_13/java/org.msscf.msscf.v2_13.cfbam.CFBamMssCF \
	cfbam_2_13/java/org.msscf.msscf.v2_13.cfbamcust.MSSBamCF \
	cfbam_2_13/java/org.msscf.msscf.v2_13.cfbamcust.CFBamXmlLoader \
	msscf_2_13/java/org.msscf.msscf.v2_13.CFCli
do
	if [ $MavenStatus == 0 ]; then
		if [ -a ${aprojdir}/pom.xml ]; then
			pushd ${aprojdir}
				mvn install
				let MavenStatus=$?
				if [ $MavenStatus != 0 ]; then
					echo "ERROR: mvn install for ${aprojdir} returned status ${MavenStatus} - build aborted"
				fi
			popd
		fi
	fi
done
if [ $MavenStatus == 0 ] then
	echo "SUCCESS: All 2.13 Java builds completed successfully"
fi
cd $MSSCFHOME
