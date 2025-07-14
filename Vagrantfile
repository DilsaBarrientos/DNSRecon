VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Kali Linux (Attacker)
  config.vm.define "kali" do |kali|
    kali.vm.box = "kalilinux/rolling"
    kali.vm.hostname = "kali"
    kali.vm.network "private_network", ip: "192.168.56.10"
    kali.vm.provision "shell", path: "kali/setup.sh"
  end

  # Ubuntu Server (DNS)
  config.vm.define "dns" do |dns|
    dns.vm.box = "ubuntu/focal64"
    dns.vm.hostname = "dns"
    dns.vm.network "private_network", ip: "192.168.56.20"
    dns.vm.provision "shell", path: "bind9/setup.sh"
  end

end
