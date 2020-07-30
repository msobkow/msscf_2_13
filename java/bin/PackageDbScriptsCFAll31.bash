#!/bin/bash
export build_tag=$*
if [ "$build_tag" == "" ]; then
	echo "PackageDbScripts31.bash ERROR A single argument build tag must be specified"
else
	if [ "${MSSCFHOME}" == "" ]; then
		echo "PackageDbScripts31.bash ERROR MSSCFHOME environment variable not found or is empty"
	else
		if [ ! -d ${MSSCFHOME} ]; then
			echo "PackageDbScripts31.bash ERROR MSSCFHOME directory ${MSSCFHOME} does not exist"
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
							archiveFileName="installer/${aproj}_3_1_${build_tag}-MSSProprietaryV1-db_scripts.zip"
							if [ -f ${archiveFileName} ]; then
								rm -f ${archiveFileName}
							fi
							if [ -d dbcreate ]; then
								echo "Packaging ${archiveFileName} ..."
								find dbcreate -name 'gpl-3.0.txt' -o -name 'LICENSE' -o -name '*.bash' -o -name '*.bat' -o -name '*.cmd' -o -name '*.xsd' -o -name '*.xml' -o -name '*.sql' -o -name '*.tsql' -o -name '*.isql' -o -name '*.pgsql' -o -name '*.plsql' -o -name '*.mysql' | grep -v build | zip '-q9@' ${archiveFileName}
								ls -l ${archiveFileName}
							fi
						popd
					fi
				done
			popd
		fi
	fi
fi
