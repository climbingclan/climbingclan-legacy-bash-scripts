#!/bin/bash
id=$1

# take argument of event ID and make all the orders in it attended and also completed

#update meta field
mysql -u root --password=`cat ~/bitnami_application_password` --database=bitnami_wordpress -se "UPDATE wp_postmeta as t, (SELECT order_id  FROM wp_order_product_customer_lookup where product_id=$id AND status='wc-processing' AND cc_attendance='pending') as temp SET meta_value='attended' WHERE temp.order_id = t.post_id AND meta_key='cc_attendance' AND meta_value='pending';" 

#mark all pending volunteers as attended
mysql -u root --password=`cat ~/bitnami_application_password` --database=bitnami_wordpress -se "UPDATE wp_postmeta as t, (SELECT order_id  FROM wp_order_product_customer_lookup where product_id=$id AND status='wc-processing' AND cc_volunteer_attendance='pending') as temp SET meta_value='attended' WHERE temp.order_id = t.post_id AND meta_key='cc_volunteer_attendance' AND meta_value='attended';" 

# set update order status
mysql -u root --password=`cat ~/bitnami_application_password` --database=bitnami_wordpress -se "SELECT order_id  FROM wp_order_product_customer_lookup where product_id=$id AND status='wc-processing';" > /tmp/file
for i in `cat /tmp/file`; do sudo wp wc shop_order update $i --status="completed" --user=1 && echo $i; done

#clean up
rm /tmp/file

# mark event hidden
sudo wp wc product update $id --status=private --user=1
