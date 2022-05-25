#!/bin/bash
product_id=$1
sudo wp wc product list --status=publish --user=1 --fields=name,id

sudo wp wc product update $product_id --stock_quantity=0 --user=1;

sudo wp wc product_variation list $product_id --user=1 --field=id > /tmp/.tmpfile
#2466
#2465

for i in `cat /tmp/.tmpfile`; do
sudo wp wc product_variation update $product_id $i --stock_quantity=0 --user=1;
done;

sudo wp wc product update $product_id --in_stock=0 --user=1

rm /tmp/.tmpfile
