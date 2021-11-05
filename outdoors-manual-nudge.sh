#!/bin/bash
# event id of bailing person

id=$1
cd ~
# get all order ids
mysql -u root --password=`cat ~/bitnami_application_password` --database=bitnami_wordpress -se "SELECT order_id  FROM wp_order_product_customer_lookup where product_id=$id AND status='wc-processing';" > /tmp/file


for i in `cat /tmp/file`; 
#update meta field
do
mysql -u root --password=`cat ~/bitnami_application_password` --database=bitnami_wordpress -se "UPDATE wp_postmeta as t, (SELECT order_id  FROM wp_order_product_customer_lookup where order_id=$i AND status='wc-processing' AND cc_attendance='pending') as temp SET meta_value='nudge' WHERE temp.order_id = t.post_id AND meta_key='email_confirmation_pre_event';" 
# set update order status
sudo wp wc shop_order update $i --status="on-hold" --user=1 && echo $i;
done
#clean up
rm /tmp/file

