# -*- mode: ruby -*-
# vi: set ft=ruby :

SubNet   = "192.168.10"
Domain   = "oloc"
topology = "%-15s %-10s %s" % ["IP:","Ports:","Host:"]

fileContent = JSON.parse(File.read("./provision.json"), symbolize_names: true)
fileContent.each do |node|
  @hostsList = "#{@hostsList}#{SubNet}.#{node[:iplastdigit]}\t#{node[:name]}.#{Domain} #{node[:name]}\n"
  topology = "#{topology}\n%-15s 22=>22%-4s %s" % \
    ["#{SubNet}.#{node[:iplastdigit]}","#{node[:iplastdigit]}","#{node[:name]}.#{Domain}"]
end
# To update the /etc/hosts with all the nodes
hostsListUpdate="echo -e \"#{@hostsList}\\n\" >> /etc/hosts"

# Status displays topology
if ARGV[0] == 'status'
  puts "#{topology}\n\n"
end

# Vagrantfile API/syntax version.
# Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian/jessie64"
  # To prevent tty errors
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  fileContent.each do |node|
    config.vm.define node[:name] do |machine|
      machine.vm.hostname = "#{node[:name]}.#{Domain}"
      machine.vm.network :private_network, ip: "#{SubNet}.#{node[:iplastdigit]}"
      machine.vm.provision :shell, :inline => hostsListUpdate

      machine.vm.provider 'virtualbox' do |vb|
        vb.customize ["modifyvm", :id, "--name", node[:name]]
        vb.customize ["modifyvm", :id, "--natpf1", ",tcp,127.0.0.1,22#{node[:iplastdigit]},,22"]
      end
    end
  end
end
