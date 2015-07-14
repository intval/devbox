# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

$provision = <<SCRIPT
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' ansible|grep "install ok installed")
echo Checking for ansible: $PKG_OK
if [ "" == "$PKG_OK" ]; then
	apt-get install -y python-software-properties software-properties-common
	apt-add-repository -y ppa:ansible/ansible
	apt-get update -y
	apt-get install -y ansible
fi

ansible-playbook /home/vg/playbook.yml
SCRIPT


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  #config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network "private_network", ip: "33.33.33.33"
  
  config.vm.hostname = "ubi"
  config.vm.synced_folder "C:/www", "/vagrant"
  config.vm.synced_folder ".", "/home/vg"
  
  config.vm.provider :virtualbox do |vb|
	  vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
  
  config.vm.provision "shell", inline: $provision

end
