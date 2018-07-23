VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento/centos-7.4"

  config.vm.define :n do | n |
    n.vm.hostname = "nginx"
    n.vm.network :private_network, ip: "192.168.33.100"#, virtualbox__intnet: "intnet"
    n.vm.provision "shell", privileged: false, inline: <<-SHELL
      echo "localhost" > /vagrant/vagrant_hosts
      echo "\\$nginx_ip=\\"localhost\\"" > /vagrant/spec/spec_hosts.rb
    SHELL
    n.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "vagrant.yml"
      ansible.inventory_path = "vagrant_hosts"
      ansible.limit = 'all'
    end
  end
end
