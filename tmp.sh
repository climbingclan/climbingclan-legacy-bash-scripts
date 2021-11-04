#!/bin/bash

for i in `cat /tmp/list`;  do sudo wp user meta update $i "cc_member" "yes"; done
