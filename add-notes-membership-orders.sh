#usuage 
#
#call.sh list-of-ids
#!/bin/bash
csv=$1

#tail -n +2  $csv | while read line 
cat $csv | while read line 
do

sudo wp wc order_note create $line --note="vitagm22_still" --user=1
#echo $line

done

