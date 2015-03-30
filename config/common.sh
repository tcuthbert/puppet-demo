#!/usr/bin/env bash

echo 'export PATH=$PATH:/opt/puppet/bin' >> /root/.bashrc && source /root/.bashrc
/etc/init.d/iptables save
/etc/init.d/iptables stop
chkconfig iptables off
