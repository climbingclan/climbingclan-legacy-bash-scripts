#usuage 
#
#call.sh meta-field-name list-of-ids

#!/bin/bash
csv=$1

#tail -n +2  $csv | while read line 
cat $csv | while read line 
do

#ccid=$( echo $line | cut -d',' -f1)
ccid=$line
admin_agm_voting_code_2022=$( pwgen -s -v 18 -1)

sudo wp user meta update $ccid $2 $admin_agm_voting_code_2022 --user=1

#echo $ccid $2 $admin_agm_voting_code_2022

done

