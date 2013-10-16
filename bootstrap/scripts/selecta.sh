#!/bin/sh

apt-get install -y ruby1.9.1-full
git clone https://github.com/garybernhardt/selecta ~/lib/selecta
ln -sf ~/lib/selecta/selecta ~/bin/selecta
