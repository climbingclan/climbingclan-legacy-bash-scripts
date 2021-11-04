#!/bin/bash

# Use $ mark-member-committee.sh 54 
#
## User ID
# eg 54
#

id=$1
key=committee_current
role=$(sudo wp user meta get $id $key --user=1)
current_key=$key"_"$role
status=retired

sudo wp user meta update $id $key retired --user=1
sudo wp user meta update $id $current_key retired --user=1

