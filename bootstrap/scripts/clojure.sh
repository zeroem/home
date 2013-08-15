#!/bin/bash

sudo apt-get --assume-yes install openjdk-7-jdk

mkdir -p ~/bin

wget -O ~/bin/lein "https://raw.github.com/technomancy/leiningen/stable/bin/lein"

chmod +x ~/bin/lein
