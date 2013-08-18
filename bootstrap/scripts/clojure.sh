#!/bin/bash

which lein

if [ $? -ne 0 ]
then
  mkdir -p ~/bin
  wget -O ~/bin/lein "https://raw.github.com/technomancy/leiningen/stable/bin/lein"
  chmod +x ~/bin/lein
fi
