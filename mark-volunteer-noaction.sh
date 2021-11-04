#!/bin/bash

id=$1

mysql -u root --password=`cat bitnami_application_password` --database=bitnami_wordpress -se "UPDATE wp_postmeta as t, (SELECT order_id  FROM wp_order_product_customer_lookup where order_id=$id) as temp SET meta_value='noaction' WHERE temp.order_id = t.post_id AND meta_key='cc_volunteer_attendance'" 

