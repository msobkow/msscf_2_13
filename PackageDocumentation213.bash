#!/bin/bash
#
export build_tag=$*
if [ "$build_tag" == "" ]; then
	echo "PackageDocumentationCF213.bash ERROR A single argument build tag must be specified"
else
	if [ "${MSSCFHOME}" == "" ]; then
		echo "PackageDocumentationCF213.bash ERROR MSSCFHOME environment variable not found or is empty"
	else
		if [ ! -d ${MSSCFHOME} ]; then
			echo "PackageDocumentationCF213.bash ERROR MSSCFHOME directory ${MSSCFHOME} does not exist"
		else
			pushd ${MSSCFHOME}
				aproj=msscf
				if [ -d ${aproj}_2_13 ]; then

					pushd ${aproj}_2_13
						if [ ! -d installer ]; then
							mkdir installer
							chmod 755 installer
						fi
						archiveFileName="`pwd`/installer/${aproj}_2_13_${build_tag}-GPLv3-doc.zip"
						if [ -f ${archiveFileName} ]; then
							rm -f ${archiveFileName}
						fi
						echo "Packaging ${archiveFileName} ..."
						if [ -d ${MSSCFHOME}/htdocs/msscode.com/msscf/2.0.13/documentation-2.13 ]; then
							pushd ${MSSCFHOME}/htdocs/msscode.com/msscf/2.0.13
								find documentation-2.13 -name 'gpl-3.0.txt' -o -name 'Apache_V2.txt' -o -name LICENSE -o -name '.htaccess' -o -name '*.css' -o -name '*.html' -o -name '*.txt' -o -name '*.xml' -o -name '*.xsd' -o -name '*.jpg' -o -name '*.gif' -o -name '*.png' -o -name '*.bash' | grep -v build | zip '-q9@' ${archiveFileName}
							popd
						fi
						ls -l ${archiveFileName}
					popd
				fi
			popd
		fi
	fi
fi
