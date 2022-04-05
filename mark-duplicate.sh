#!/bin/bash

#ticket ID of duplicate ticket

id=$1


#update meta field
mysql -u root --password=`cat ~/bitnami_application_password` --database=bitnami_wordpress -se "UPDATE wp_postmeta as t, (SELECT order_id  FROM wp_order_product_customer_lookup where order_id=$id) as temp SET meta_value='duplicate' WHERE temp.order_id = t.post_id AND meta_key='cc_attendance';" > /tmp/file

# set update order status
sudo wp wc shop_order update $id --status="completed" --user=1 && echo $id

#clean up
rm /tmp/file

