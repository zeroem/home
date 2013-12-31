#!/bin/bash

PLUGINS=(vagrant-lxc vagrant-hostmanager)

wget -P /tmp/ "https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.1_x86_64.deb"

sudo dpkg --skip-same-version -i /tmp/vagrant_1.4.1_x86_64.deb

INSTALLED_PLUGINS=`vagrant plugin list`

for PLUGIN in "${PLUGINS[@]}"
do
  vagrant plugin install ${PLUGIN}
done
