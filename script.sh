#!/bin/bash
sudo wp wc product_variation update 1972 1973 --stock_quantity=6 --user=1;
sudo wp wc product_variation update 1972 1974 --stock_quantity=7 --user=1;
sleep 29m;
sudo wp wc product_variation update 2018 2020 --stock_quantity=10 --user=1;
sudo wp wc product_variation update 2019 2020 --stock_quantity=1 --user=1;
