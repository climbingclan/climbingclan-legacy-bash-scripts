#!/bin/bash

# Use $ mark-member-committee.sh 54 president
#
## User ID
# eg 54
#
## Roles
##
# president
# secretary
# treasurer
# climbing_sec
# chair

id=$1
role=$2

key=committee_current
current_key=$key"_"$role

sudo wp user meta update $id $key $role --user=1
sudo wp user meta update $id $current_key serving --user=1

