#!/bin/bash

curl -s http://d35ac8ww5dfjyg.cloudfront.net/playground/bins/0.5.9/LightTableLinux64.tar.gz | tar -C ~/lib -xz

# Hack for ubuntu, libudev.so.1 is libudev.so.0
ln -sf /lib/x86_64-linux-gnu/libudev.so.1 /lib/x86_64-linux-gnu/libudev.so.0
ln -sf ~/lib/LightTable/ltbin ~/bin/ltbin
