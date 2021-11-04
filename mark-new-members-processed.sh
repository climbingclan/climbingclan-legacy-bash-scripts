#!/bin/bash
membership_event_id=2118

# set update order status

mysql -u root --password=`cat bitnami_application_password` --database=bitnami_wordpress -se "SELECT o.order_id  FROM wp_order_product_customer_lookup o JOIN wp_member_db m on o.user_id=m.id where o.product_id=$membership_event_id AND o.status='wc-processing' AND 'm.admin-bmc-membership-number' IS NOT NULL ;" > /tmp/file
for i in `cat /tmp/file`; do sudo wp wc shop_order update $i --status="completed" --user=1 && echo $i; done

#clean up
rm /tmp/file

