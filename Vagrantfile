# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box      = "centos7-2"
	config.vm.box_url  = "https://s3-us-west-2.amazonaws.com/osfsufiabox/centos_7-2.box"
	config.vm.hostname = "ades01v.orshakes.org"
	config.vm.network "forwarded_port", guest: 80, host: 8080
	config.vm.network "forwarded_port", guest: 443, host: 8443
	config.vm.network "forwarded_port", guest: 6379, host: 6379
	config.vm.network "forwarded_port", guest: 8000, host: 8000
	config.vm.network "forwarded_port", guest: 9200, host: 9200

	config.vm.provision "shell",
		inline: "sudo hostnamectl set-hostname ades01v.orshakes.org; sudo yum update -y; sudo yum -y install bind-utils net-tools"

	config.vm.provider "virtualbox" do |vb|
		vb.customize ["modifyvm", :id, "--cpus", "2"]
		vb.customize ["modifyvm", :id, "--memory", "2048"]
	end

	config.vm.provision "puppet" do |puppet|
		puppet.manifests_path = "puppet/manifests"
		puppet.module_path    = "puppet/modules"
		puppet.manifest_file  = "ades01v.pp"
		puppet.options        = "--verbose --debug"
	end

end
