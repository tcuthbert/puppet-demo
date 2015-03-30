# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2', &Oscar.run(File.expand_path('../config', __FILE__))) if defined? Oscar

Vagrant.configure('2') do |config|
  config.pe_build.download_root = "data/"
  config.pe_build.filename = "puppet-enterprise-3.7.2-el-6-x86_64.tar.gz"
  config.vm.provision "shell", path: "config/common.sh"

  config.vm.define "master-top.puppetdemo.local" do |sh|
    sh.vm.provision "shell", path: "config/master_bootstrap.sh"
    sh.vm.provision "shell", inline: "puppet module install zack-r10k"
    sh.vm.provision "shell", inline: "puppet apply -e 'class { \"r10k\": remote => \"https://github.com/tcuthbert/environmentsrepo\"  }'"
  end
  config.vm.define "master-mid-green.puppetdemo.local" do |sh|
    sh.vm.provision "shell", path: "config/master_join.sh"
    sh.vm.provision "shell", path: "config/master_bootstrap.sh"
  end
  config.vm.define "master-mid-blue.puppetdemo.local" do |sh|
    sh.vm.provision "shell", path: "config/master_join.sh"
    sh.vm.provision "shell", path: "config/master_bootstrap.sh"
  end
end
