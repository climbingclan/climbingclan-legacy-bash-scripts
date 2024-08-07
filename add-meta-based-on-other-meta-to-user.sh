
#usuage 
#
#call.sh meta-field-name list-of-ids

#!/bin/bash
csv=$1

#tail -n +2  $csv | while read line 
cat $csv | while read line 
do


#ccid=$( echo $line | cut -d',' -f1)
#user_id=$( mysql -u root --password=`cat ~/bitnami_application_password` --database=bitnami_wordpress -se "select id from wp_member_voting where admin_agm_voting_code_2022='$line';" | tail -2 )
user_id=$line

sudo wp user meta update $user_id admin_agm_voting_code_2022_voted yes --user=1

#echo $line 

echo $user_id

done



