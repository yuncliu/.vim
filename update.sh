#!/bin/bash

cd bundle
for i in `ls`
do
    cd $i
    echo `pwd`
    git pull
    cd ..
done
