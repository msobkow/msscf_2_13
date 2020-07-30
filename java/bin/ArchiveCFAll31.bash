#!/bin/bash
export build_tag=$*
if [ "$build_tag" == "" ]; then
	echo "ArchiveCFAll31.bash ERROR A single argument build tag must be specified"
else
	if [ "${MSSCFHOME}" == "" ]; then
		echo "ArchiveCFAll31.bash ERROR MSSCFHOME environment variable not found or is empty"
	else
		if [ ! -d ${MSSCFHOME} ]; then
			echo "ArchiveCFAll31.bash ERROR MSSCFHOME directory ${MSSCFHOME} does not exist"
		else
			pushd ${MSSCFHOME}
				for aproj in cflib cfcore cfsec cfint cfcrm cfdbtst cfbam msscf cfast cffrsw cfacc
				do
					if [ -d ${aproj}_3_1 ]; then
						pushd ${aproj}_3_1
							if [ ! -d installer ]; then
								mkdir installer
								chmod 755 installer
							fi
							archiveFileName="installer/${aproj}_3_1_${build_tag}-MSSProprietaryV1-src.zip"
							if [ -f ${archiveFileName} ]; then
								rm -f ${archiveFileName}
							fi
							echo "Archiving ${archiveFileName} ..."
							find . -name 'README.md' -o -name '*.ex' -o -name 'gpl-3.0.txt' -o -name 'LICENSE' -o -name '.gitattributes' -o -name '.gitignore' -o -name '*.bash' -o -name '*.bat' -o -name '*.cmd' -o -name '*.xsd' -o -name '*.xml' -o -name '*.html' -o -name '*.txt' -o -name '*.java' -o -name '*.cpp' -o -name '*.hpp' -o -name 'Makefile.am' -o -name 'configure.ac' -o -name '*.cs' -o -name '*.sql' -o -name '*.tsql' -o -name '*.isql' -o -name '*.pgsql' -o -name '*.plsql' -o -name '*.mysql' | grep -v build | zip '-q9@' ${archiveFileName}
							ls -l ${archiveFileName}
						popd
					fi
				done
			popd
		fi
	fi
fi
