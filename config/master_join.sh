#!/bin/bash

yum -y install git
curl -k https://master-top.puppetdemo.local:8140/packages/current/install.bash | sudo bash -s main:environmentpath=/etc/puppetlabs/puppet/environments
cp /vagrant/config/hiera.yaml /etc/puppetlabs/puppet/
ln -fs /etc/puppetlabs/puppet/hiera.yaml /etc/hiera.yaml
