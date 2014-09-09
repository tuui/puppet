VAGRANTFILE_API_VERSION = "2"
FILES_PATH = "puppet/files"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

	# Ubuntu
	config.vm.box = "precise64"
	config.vm.box_url = "http://files.vagrantup.com/precise64.box"
	
	# Debian
	#config.vm.box = "lucid32"
	#config.vm.box_url = "http://files.vagrantup.com/lucid32.box"

	config.vm.network :private_network, ip: "192.168.33.101"
	config.vm.network :forwarded_port, guest: 80, host: 80
	config.vm.network :forwarded_port, guest: 8080, host: 8080
	
	config.vm.synced_folder FILES_PATH, "/home/vagrant/files", :nfs => true

	config.vm.provision :puppet do |puppet|
		puppet.manifests_path = "puppet/manifests"
		puppet.module_path = "puppet/modules"
		puppet.manifest_file = "default.pp"
		puppet.options = ['--verbose']
	end

end