###################################
# malpaw.vagrant.aseprite-builder #
# Vagrant configuration           #
###################################

Vagrant.require_version ">=1.6.0"

Vagrant.configure("2") do |config|

    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 1
    end

	# have to use xenial instead of cosmic until elementary os updates vagrant to >=2.0
	config.vm.box = "ubuntu/xenial64"
	config.vm.hostname = "aseprite-builder"

	config.vm.synced_folder "workspace/", "/home/vagrant/workspace"
	config.vm.provision "shell", path: "provision.sh"
end
