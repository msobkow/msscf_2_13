#!/bin/bash
#
#	MSS Code Factory 2.13
#
#	Copyright (c) 2020 Mark Stephen Sobkow
#	
#	Licensed under the Apache License, Version 2.0 (the "License");
#	you may not use this file except in compliance with the License.
#	You may obtain a copy of the License at
#	
#	    http://www.apache.org/licenses/LICENSE-2.0
#	
#	Unless required by applicable law or agreed to in writing, software
#	distributed under the License is distributed on an "AS IS" BASIS,
#	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#	See the License for the specific language governing permissions and
#	limitations under the License.
#
MAJOR_VERSION=2
MINOR_VERSION=13
pushd msscfcli
	if [ ! -d /usr/bin/msobkow ]; then
		sudo mkdir /usr/include/msobkow
	fi
	sudo chmod 755 /usr/bin/msobkow
	if [ ! -d /usr/bin/msobkow/${MAJOR_VERSION}.0.${MINOR_VERSION} ]; then
		sudo mkdir /usr/include/msobkow/${MAJOR_VERSION}.0.${MINOR_VERSION}
	fi
	sudo chmod 755 /usr/bin/msobkow/${MAJOR_VERSION}.0.${MINOR_VERSION}
	sudo make install
	sudo chmod 755 /usr/bin/msobkow
	sudo chmod 755 /usr/bin/msobkow/${MAJOR_VERSION}.0.${MINOR_VERSION}
	sudo chmod 755 /usr/bin/msobkow/${MAJOR_VERSION}.0.${MINOR_VERSION}/msscfcli
	sudo ldconfig
popd
