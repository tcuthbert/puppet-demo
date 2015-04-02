# Showcase Puppet Enterprise MoM Deployment

## Getting Started

Before getting started download a copy of puppet enterprise for CentOs 6 and place it in a directory named data

```bash
git clone https://github.com/tcuthbert/puppet-demo --recursive
cd puppet-demo
mkdir ./data
cp ~/Downloads/puppet-enterprise-3.7.2-el-6-x86_64.tar.gz ./data
vagrant plugin install oscar
vagrant up
```

What this gives you is a Puppet master, Puppet middle-master and an agent.
The master will bootstrap an r10k deployment pointing to a git repo at [this repo](https://github.com/tcuthbert/environmentsrepo)
