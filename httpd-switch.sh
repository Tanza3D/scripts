#!/bin/bash
set -x

SVRPATH=`grep 'Directory ".*"' /etc/httpd/conf/httpd.conf -m 1 -o`
SVRPATH=${SVRPATH/Directory \"/}
SVRPATH=${SVRPATH::-1}

NEWPATH=$1

echo "Replacing $SVRPATH with $NEWPATH"

perl -i -pe "s~$SVRPATH~$NEWPATH~g" /etc/httpd/conf/httpd.conf
systemctl restart httpd
