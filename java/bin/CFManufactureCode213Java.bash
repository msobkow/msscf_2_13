#!/bin/bash
cd $MSSCFHOME/msscf_2_13/java/bin
if [ "$LOG4J2_CONF" != "" ]; then
	export JAVA_LOG4J="-Dlog4j.configurationFile=$LOG4J2_CONF"
else
	export JAVA_LOG4J=""
fi
$JAVA $JAVA_LOG4J -ea -Xms1023M --class-path "./org.msscf.msscf.v2_13.CFCli-2.13.11195.jar${JSEP}./org.msscf.msscf.v2_13.cfbam-2.13.11195.jar${JSEP}./org.msscf.msscf.v2_13.cfbam.CFBamSaxLoader-2.13.11195.jar${JSEP}./org.msscf.msscf.v2_13.cfbam.CFBamRam-2.13.11195.jar${JSEP}./org.msscf.msscf.v2_13.cfbam.CFBamMssCF-2.13.11195.jar${JSEP}./org.msscf.msscf.v2_13.cfbamcust.MSSBamCF-2.13.11195.jar${JSEP}./org.msscf.msscf.v2_13.cfbamcust.CFBamXmlLoader-2.13.11195.jar${JSEP}./org.msscf.msscf.v2_13.cfint-2.13.11195.jar${JSEP}./org.msscf.msscf.v2_13.cfint.CFIntSaxLoader-2.13.11195.jar${JSEP}./org.msscf.msscf.v2_13.cfsec-2.13.11195.jar${JSEP}./org.msscf.msscf.v2_13.cfsec.CFSecSaxLoader-2.13.11195.jar${JSEP}./org.msscf.msscf.v2_13.cfcore-2.13.11195.jar${JSEP}./org.msscf.msscf.v2_13.cflib.CFLib-2.13.11195.jar${JSEP}./org.msscf.msscf.v2_13.cflib.CFLib.JavaFX-2.13.11195.jar${JSEP}./commons-codec-1.14.jar${JSEP}./commons-io-2.7.jar${JSEP}./commons-logging-1.2.jar${JSEP}./log4j-1.2-api-2.13.3.jar${JSEP}./log4j-1.2.12.jar${JSEP}./log4j-api-2.13.3.jar${JSEP}./log4j-core-2.13.3.jar${JSEP}./httpclient-4.5.12.jar${JSEP}./httpcore-4.4.13.jar${JSEP}./xercesImpl-2.12.0.jar${JSEP}./xpath2-1.2.0.jar" org.msscf.msscf.v2_13.CFCli.CFCli $@
cd $MSSCFHOME
