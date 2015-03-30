# Showcase Puppet Enterprise MoM Deployment

## Getting Started

Before getting started download a copy of puppet enterprise and place it in a directory named data

```bash
mkdir ./data
cp ~/Downloads/puppet-enterprise-3.7.2-el-7-x86_64.tar.gz ./data
vagrant plugin install oscar
vagrant up
```

What this gives you is a Puppet master, Puppet middle-master and an agent.
The master will bootstrap an r10k deployment pointing to a bare git repo at /vagrant/config/environmentsrepo
