Vagrant.configure("2") do |config|
    config.vm.box = "storm-deploy"
    config.vm.box_url = "https://s3.amazonaws.com/parsely-vagrant/storm-deploy.box"
    config.ssh.forward_agent = true
    config.vm.synced_folder "/home/pixelmonkey/repos", "/home/vagrant/parsely"
    ports = [
        5432,       # postgresql
        27017,      # mongodb
        6379,       # redis
        8000, 8080, # storm UI
        9042, 9160, # cassandra
        9200, 9300  # elasticsearch
    ]
    ports.each { |port|
        config.vm.network "forwarded_port", guest: port, host: port
    }
    config.vm.provider "virtualbox" do |v|
        # allow pipework (software-defined networking)
        v.customize ['modifyvm', :id, '--nicpromisc1', 'allow-all']
        # limit CPU usage
        v.customize ["modifyvm", :id, "--cpuexecutioncap", "70"]
        # 1.6gb of RAM
        v.memory = 1536
        # 2 vCPUs
        v.cpus = 2
    end
end
