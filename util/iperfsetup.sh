#!/bin/bash

# Install iperfs if not already installed
IPERF_OK=$(dpkg-query -W --showformat='${Status}\n' iperf3 | grep "install ok installed")
if [ "" == "$IPERF_OK" ]; then
  sudo apt-get update
  sudo apt-get -y install screen iperf software-properties-common python-software-properties
  sudo add-apt-repository -y "ppa:patrickdk/general-lucid"
  sudo apt-get update 
  sudo apt-get -y install iperf3
fi

