#!/bin/bash


# for i in `cat /tmp/list2`; do bash mark-outdoors-crag-froggatt.sh $i; done

id=$1

# take argument of event ID and make all the orders in it attended and also completed

#update meta field
mysql -u root --password=`cat ~/bitnami_application_password` --database=bitnami_wordpress -se "UPDATE wp_postmeta as t, (SELECT order_id  FROM wp_order_product_customer_lookup where order_id=$id AND status='wc-processing' AND cc_attendance='pending') as temp SET meta_value='windgather' WHERE temp.order_id = t.post_id AND meta_key='cc_location' AND meta_value='pending';" 

# set update order status
sudo wp wc shop_order update $1 --status="on-hold" --user=1


