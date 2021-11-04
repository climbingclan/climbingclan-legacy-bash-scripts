#!/bin/bash
csv=$1

tail -n +2  $csv | while read line 
do

ccid=$( echo $line | cut -d',' -f1)
bmcid=$( echo $line | cut -d',' -f2)

sudo wp user meta update $ccid admin-bmc-membership-number $bmcid --user=1


done
