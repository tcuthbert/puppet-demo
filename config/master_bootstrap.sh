#!/usr/bin/env bash

#source /root/.bashrc
#puppet module install zack-r10k 
#/opt/puppet/bin/gem install r10k
cp /vagrant/config/{hiera.yaml,r10k.yaml} /etc/puppetlabs/puppet/
cd /etc/
ln -fs /etc/puppetlabs/puppet/{hiera.yaml,r10k.yaml}
#puppet apply -e "/vagrant/environments/site/base/manifests/profiles/r10k_installation.pp"
#cp /var/lib/peadmin/.mcollective ~/
#mco r10k synchronize
