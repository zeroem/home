#!/bin/sh

curl -s http://scala-lang.org/files/archive/scala-2.10.3.tgz | tar -C ~/lib -xz

cd ~/bin

find ~/lib/scala-2.10.3/bin -type f ! -name "*.bat" -exec ln -sf {} \;
