#!/bin/bash
Revision=$1
let RefreshStatus=0
if [ "$Revision" == "" ]; then
	echo "ERROR: Revision (argument 1) not specified" 1>&2
else
	cd $MSSCFHOME/msscf_2_13/java
	export Revision
	echo "Preparing bin directory..."
	rm -f bin/*.jar
	for ajar in ~/.m2/repository/commons-codec/commons-codec/1.14/commons-codec-1.14.jar \
		~/.m2/repository/commons-io/commons-io/2.7/commons-io-2.7.jar \
		~/.m2/repository/commons-logging/commons-logging/1.2/commons-logging-1.2.jar \
		~/.m2/repository/log4j/log4j/1.2.12/log4j-1.2.12.jar \
		~/.m2/repository/org/apache/logging/log4j/log4j-core/2.13.3/log4j-core-2.13.3.jar \
		~/.m2/repository/org/apache/logging/log4j/log4j-api/2.13.3/log4j-api-2.13.3.jar \
		~/.m2/repository/org/apache/logging/log4j/log4j-1.2-api/2.13.3/log4j-1.2-api-2.13.3.jar \
		~/.m2/repository/xerces/xercesImpl/2.12.0/xercesImpl-2.12.0.jar \
		~/.m2/repository/org/apache/httpcomponents/httpclient/4.5.12/httpclient-4.5.12.jar \
		~/.m2/repository/org/apache/httpcomponents/httpcore/4.4.13/httpcore-4.4.13.jar \
		~/.m2/repository/org/exist-db/thirdparty/org/eclipse/wst/xml/xpath2/1.2.0/xpath2-1.2.0.jar \
		~/.m2/repository/org/msscf/msscf/v2_13/org.msscf.msscf.v2_13.cflib.CFLib/2.13.${Revision}/org.msscf.msscf.v2_13.cflib.CFLib-2.13.${Revision}.jar \
		~/.m2/repository/org/msscf/msscf/v2_13/org.msscf.msscf.v2_13.cflib.CFLib.JavaFX/2.13.${Revision}/org.msscf.msscf.v2_13.cflib.CFLib.JavaFX-2.13.${Revision}.jar \
		~/.m2/repository/org/msscf/msscf/v2_13/org.msscf.msscf.v2_13.cfcore/2.13.${Revision}/org.msscf.msscf.v2_13.cfcore-2.13.${Revision}.jar \
		~/.m2/repository/org/msscf/msscf/v2_13/org.msscf.msscf.v2_13.cfsec/2.13.${Revision}/org.msscf.msscf.v2_13.cfsec-2.13.${Revision}.jar \
		~/.m2/repository/org/msscf/msscf/v2_13/org.msscf.msscf.v2_13.cfsec.CFSecSaxLoader/2.13.${Revision}/org.msscf.msscf.v2_13.cfsec.CFSecSaxLoader-2.13.${Revision}.jar \
		~/.m2/repository/org/msscf/msscf/v2_13/org.msscf.msscf.v2_13.cfint/2.13.${Revision}/org.msscf.msscf.v2_13.cfint-2.13.${Revision}.jar \
		~/.m2/repository/org/msscf/msscf/v2_13/org.msscf.msscf.v2_13.cfint.CFIntSaxLoader/2.13.${Revision}/org.msscf.msscf.v2_13.cfint.CFIntSaxLoader-2.13.${Revision}.jar \
		~/.m2/repository/org/msscf/msscf/v2_13/org.msscf.msscf.v2_13.cfbam/2.13.${Revision}/org.msscf.msscf.v2_13.cfbam-2.13.${Revision}.jar \
		~/.m2/repository/org/msscf/msscf/v2_13/org.msscf.msscf.v2_13.cfbam.CFBamSaxLoader/2.13.${Revision}/org.msscf.msscf.v2_13.cfbam.CFBamSaxLoader-2.13.${Revision}.jar \
		~/.m2/repository/org/msscf/msscf/v2_13/org.msscf.msscf.v2_13.cfbam.CFBamRam/2.13.${Revision}/org.msscf.msscf.v2_13.cfbam.CFBamRam-2.13.${Revision}.jar \
		~/.m2/repository/org/msscf/msscf/v2_13/org.msscf.msscf.v2_13.cfbam.CFBamMssCF/2.13.${Revision}/org.msscf.msscf.v2_13.cfbam.CFBamMssCF-2.13.${Revision}.jar \
		~/.m2/repository/org/msscf/msscf/v2_13/org.msscf.msscf.v2_13.cfbamcust.MSSBamCF/2.13.${Revision}/org.msscf.msscf.v2_13.cfbamcust.MSSBamCF-2.13.${Revision}.jar \
		~/.m2/repository/org/msscf/msscf/v2_13/org.msscf.msscf.v2_13.cfbamcust.CFBamXmlLoader/2.13.${Revision}/org.msscf.msscf.v2_13.cfbamcust.CFBamXmlLoader-2.13.${Revision}.jar \
		~/.m2/repository/org/msscf/msscf/v2_13/org.msscf.msscf.v2_13.CFCli/2.13.${Revision}/org.msscf.msscf.v2_13.CFCli-2.13.${Revision}.jar
	do
		if [ ! -f $ajar ]; then
			echo "ERROR: Could not resolve Maven repository jar expected to be found in $ajar ..."
			let RefreshStatus=1
		else
			cp $ajar bin
		fi
	done
	exit $RefreshStatus
fi
