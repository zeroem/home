#!/bin/bash
curl -s http://d35ac8ww5dfjyg.cloudfront.net/playground/bins/0.6.0/LightTableLinux64.tar.gz | tar -C ~/lib -xz

# Hack for ubuntu, libudev.so.1 is libudev.so.0
if [ ! -f /lib/x86_64-linux-gnu/libudev.so.0 ]
then
  ln -sf /lib/x86_64-linux-gnu/libudev.so.1 /lib/x86_64-linux-gnu/libudev.so.0
fi

ln -sf ~/lib/LightTable/ltbin ~/bin/ltbin
