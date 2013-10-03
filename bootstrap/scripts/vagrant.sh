#!/bin/bash

PLUGINS=(vagrant-lxc vagrant-hostmanager)

wget -P /tmp/ "http://files.vagrantup.com/packages/0ac2a87388419b989c3c0d0318cc97df3b0ed27d/vagrant_1.3.4_x86_64.deb"
sudo dpkg --skip-same-version -i /tmp/vagrant_1.3.4_x86_64.deb

INSTALLED_PLUGINS=`vagrant plugin list`

for PLUGIN in "${PLUGINS[@]}"
do
  echo "${INSTALLED_PLUGINS}" | grep -q "${PLUGIN}"

  if [ $? -ne 0 ]
  then
    vagrant plugin install ${PLUGIN}
  fi
done
