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

## Now we play the waiting game

It takes roughly 30 minutes for all the agents to register themselves up with the masters. Feel free to fast track the process by vagrant ssh'ing into each agent and entering a manual puppet run:

```bash
sudo puppet agent -t
```

If you get an error 400. Don't stress, it's just the masters a little over worked during the build process. Any issues please submit through the project issues.
