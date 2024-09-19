#!/bin/bash
for i in `cat /tmp/file`; do 
sudo wp wc shop_order update $i --meta_data='[{"key": "cc_attendance","value": "attended"}]' --status="completed"  --user=1  && echo $i; done

#clean up
rm /tmp/file


