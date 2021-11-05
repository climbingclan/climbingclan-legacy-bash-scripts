#!/bin/bash

product_id=$1

# get all products
#sudo wp wc product list --status=publish --user=1 --fields=name,id

sudo wp wc product_variation list $product_id --user=1 --fields=id,stock_quantity,description
