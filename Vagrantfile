Vagrant.configure("2") do |config|
  config.vm.define "HAProxy" do |config|
      config.vm.box = "ubuntu/trusty64"
      config.vm.hostname = "HAProxy"

      config.vm.network "private_network", ip: "192.168.80.2"
      config.vm.network :"public_network", ip: "192.168.8.209"


     config.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--name", "HAProxy"]
      end
    end

  config.vm.define "Moodle" do |config|
      config.vm.box = "ubuntu/trusty64"
      config.vm.hostname = "Moodle"

      config.vm.network "private_network", ip: "192.168.80.10"


     config.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--name", "Moodle"]
      end
    end

  config.vm.define "Apache1" do |config|
      config.vm.box = "ubuntu/trusty64"
      config.vm.hostname = "Apache1"

      config.vm.network "private_network", ip: "192.168.80.80"


     config.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--name", "Apache1"]
      end
    end

  config.vm.define "Apache2" do |config|
      config.vm.box = "ubuntu/trusty64"
      config.vm.hostname = "Apache2"

      config.vm.network "private_network", ip: "192.168.80.81"


     config.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--name", "Apache2"]
      end
    end

  config.vm.define "Asterisk1" do |config|
      config.vm.box = "ubuntu/trusty64"
      config.vm.hostname = "Asterisk1"

      config.vm.network "private_network", ip: "192.168.80.20"
      config.vm.synced_folder "tasks/Asterisk/asterisk", "/tmp/asterisk"

     config.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--name", "Asterisk1"]
      end
    end

    config.vm.define "Asterisk2" do |config|
      config.vm.box = "ubuntu/trusty64"
      config.vm.hostname = "Asterisk2"

      config.vm.network "private_network", ip: "192.168.80.21"
      config.vm.synced_folder "tasks/Asterisk/asterisk", "/tmp/asterisk"


     config.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--name", "Asterisk2"]
      end
    end

  config.vm.define "ftpserver" do |ftpserver|
    ftpserver.vm.box = "debian/wheezy64"
    ftpserver.vm.hostname = "ftpserver"

    ftpserver.vm.network "private_network", ip: "192.168.80.3"

   ftpserver.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "ftpserver"]
    end
  end

  config.vm.define "Mysql1" do |db|
    db.vm.box = "debian/wheezy64"
    db.vm.hostname = "Mysql1"

    db.vm.network "private_network", ip: "192.168.80.4"

   db.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "Mysql1"]
    end
  end
  config.vm.define "Mysql2" do |db|
    db.vm.box = "debian/wheezy64"
    db.vm.hostname = "Mysql2"

    db.vm.network "private_network", ip: "192.168.80.5"

   db.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "Mysql2"]
    end
  end
  config.vm.define "ldap" do |ldap|
    ldap.vm.box = "ubuntu/trusty64"
    ldap.vm.hostname = "ldap"

    ldap.vm.network "private_network", ip: "192.168.80.6"

   ldap.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "ldap"]
    end
  end
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "tasks/netdata.yml"
  end
end
