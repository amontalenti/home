Vagrant.configure("2") do |config|
    config.vm.box = "precise64chef11"
    config.vm.box_url = "https://s3.amazonaws.com/parsely-vagrant/precise64chef11.box"
    config.ssh.forward_agent = true
    config.vm.synced_folder "/home/am/repos", "/home/vagrant/parsely"

    config.vm.network "private_network", ip: "192.168.50.50"

    config.vm.provider "virtualbox" do |v|
        # allow software-defined networking
        v.customize ['modifyvm', :id, '--nicpromisc1', 'allow-all']
        # limit CPU usage
        v.customize ["modifyvm", :id, "--cpuexecutioncap", "70"]
        # 1.6gb of RAM
        v.memory = 1536
        # 2 vCPUs
        v.cpus = 2
        # make virtualbox name match vagrant box name
        v.name = config.vm.box
    end
end
