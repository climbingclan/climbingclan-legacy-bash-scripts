#!/bin/bash
# get all products
sudo wp wc product list --status=publish --user=1 --fields=name,id

