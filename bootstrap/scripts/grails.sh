#!/bin/sh

which grails > /dev/null

if [ $? -ne 0 ]
then
  URL="http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/grails-2.2.4.zip"
  FILE="/tmp/grails-2.2.4.zip"

  if [ ! -f "${FILE}" ]
  then
    wget -P /tmp "${URL}"
  fi

  mkdir -p ~/lib
  unzip -q -o -d ~/lib "${FILE}"

  if [ -z "${JAVA_HOME}" ]
  then
    JAVA_HOME=$(dirname $(dirname $( readlink -f `which java`)))
    echo "export JAVA_HOME=${JAVA_HOME}" >> ~/.bootstrap
  fi

  which grails > /dev/null

  if [ $? -ne 0 ]
  then
    echo 'export PATH="~/lib/grails-2.2.4/bin:${PATH}"' >> ~/.bootstrap
  fi
fi
