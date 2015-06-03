$script = <<SCRIPT
sudo apt-get update -y
sudo apt-get install curl -y
sudo apt-get install docker.io -y
wget http://www.tinycorelinux.net/5.x/x86/tcz/python.tcz && tce-load -i python.tcz && rm -f python.tcz
curl -O https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
wget https://bootstrap.pypa.io/ez_setup.py -O - | sudo python
wget -O cf.tgz http://cli.run.pivotal.io/stable?release=linux64-binary
sudo tar -zxvf cf.tgz -C /usr/bin/
wget https://static-ice.ng.bluemix.net/icecli-2.0.zip
sudo pip install icecli-2.0.zip
SCRIPT

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.auto_detect = true
    config.cache.scope = :box
  end

  config.vm.define :bluecontainer do |client_config| 
  
    client_config.vm.box = "parallels/ubuntu-14.10_x64"
    #client_config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    client_config.vm.network :private_network, :ip => "10.1.2.100"
    client_config.vm.hostname = "bluecontainer"
    
    client_config.vm.provision :shell, :inline => $script
    
  end

end
