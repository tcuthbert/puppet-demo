#!/usr/bin/env bash

#source /root/.bashrc
#puppet module install zack-r10k 
#/opt/puppet/bin/gem install r10k
cp /vagrant/config/hiera.yaml /etc/puppetlabs/puppet/
ln -fs /etc/puppetlabs/puppet/hiera.yaml /etc/hiera.yaml
mkdir -p /etc/puppetlabs/puppet/environments/production
puppet module install zack-r10k && \
puppet apply -e 'class { "r10k": remote => "https://github.com/tcuthbert/environmentsrepo" }' && \
rm -fr /etc/puppetlabs/puppet/environments/production/*
r10k deploy environment -pv 
gem install hiera-redis
/opt/puppet/bin/puppetserver gem install hiera-redis
#puppet apply -e 'class { "r10k": remote => "https://github.com/tcuthbert/environmentsrepo"  }'
#puppet apply -e "/vagrant/environments/site/base/manifests/profiles/r10k_installation.pp"
#cp /var/lib/peadmin/.mcollective ~/
#mco r10k synchronize
