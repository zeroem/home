#!/bin/bash

PLUGINS=(vagrant-lxc vagrant-hostmanager)

wget -P /tmp/ "http://files.vagrantup.com/packages/a40522f5fabccb9ddabad03d836e120ff5d14093/vagrant_1.3.5_x86_64.deb"
sudo dpkg --skip-same-version -i /tmp/vagrant_1.3.5_x86_64.deb

INSTALLED_PLUGINS=`vagrant plugin list`

for PLUGIN in "${PLUGINS[@]}"
do
  echo "${INSTALLED_PLUGINS}" | grep -q "${PLUGIN}"

  if [ $? -ne 0 ]
  then
    vagrant plugin install ${PLUGIN}
  fi
done
