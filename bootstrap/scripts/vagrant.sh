#!/bin/bash

PLUGINS=(vagrant-lxc)

which vagrant > /dev/null

if [ $? -ne 0 ]
then
  wget -P /tmp/ "http://files.vagrantup.com/packages/7ec0ee1d00a916f80b109a298bab08e391945243/vagrant_1.2.7_i686.deb"
  sudo dpkg --skip-same-version -i /tmp/vagrant_1.2.7_i686.deb
fi

INSTALLED_PLUGINS=`vagrant plugin list`

for PLUGIN in "${PLUGINS[@]}"
do
  echo "${INSTALLED_PLUGINS}" | grep -q "${PLUGIN}"

  if [ $? -ne 0 ]
  then
    vagrant plugin install ${PLUGIN}
  fi
done
