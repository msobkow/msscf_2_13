#!/bin/bash
buildString=$1
toolsetNames="$2 $3 $4 $5 $6 $7 $8 $9"
msscfcli ${buildString} com-github-msobkow-CFBam-2-14-CFBam com-github-msobkow-213-layered+msscf ${toolsetNames}
