# Showcase Puppet Enterprise MoM Deployment

## Getting Started

Before getting started download a copy of puppet enterprise for CentOs 6 and place it in a directory named data

```bash
git clone https://github.com/tcuthbert/puppet-demo --recursive
cd puppet-demo
mkdir ./data
cp ~/Downloads/puppet-enterprise-3.7.2-el-6-x86_64.tar.gz ./data
vagrant plugin install oscar
vagrant up master-top.puppetdemo.local && \
vagrant up master-mid-green.puppetdemo.local
```

## Configure the masters

What this gives you is a Puppet master and a Puppet middle-master. Following instruction from the Puppet doco: [Step 3:](https://docs.puppetlabs.com/pe/latest/install_multimaster.html#step-3-classify-the-new-compile-master-node) __Classify the New Compile Master Node__,
Create a node classification rule to pin any hostname with the regex __master__ into the PE Master console node group.
Now either wait the 30 minutes on jump on each mid master and execute a pupet run

```bash
vagrant ssh master-mid-green.puppetdemo.local

sudo -i
puppet agent -t
```

## Configure the agents

This should configure the node to act as a master proxy for __master-top__.
It is now safe to bring up the agents.

```bash
vagrant up
```
