# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.box_version = "= 2.3.5"
  config.vm.synced_folder ".", "/vagrant"

  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 8000, host: 8000, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 5432, host: 5432, host_ip: "127.0.0.1"

  # Work around disconnected virtual network cable.
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get -qqy update

    # Work around https://github.com/chef/bento/issues/661
    # apt-get -qqy upgrade
    DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade

    apt-get -qqy install make zip unzip postgresql apache2

    # apt-get -qqy install python3 python3-pip
    # pip3 install --upgrade pip
    # pip3 install flask packaging oauth2client redis passlib flask-httpauth
    # pip3 install sqlalchemy flask-sqlalchemy psycopg2-binary bleach requests

    apt-get -qqy install python python-pip
    apt-get purge python-pip
    apt-get update
    apt-get install python-pip

    apt-get install libapache2-mod-wsgi
 
    # pip2 install --upgrade pip
    pip2 install flask packaging oauth2client redis passlib flask-httpauth
    pip2 install sqlalchemy flask-sqlalchemy psycopg2-binary bleach requests
    pip2 install httplib2

    a2enmod wsgi 

#    #
#    # postgresql account/password issues:
#    # https://askubuntu.com/questions/1006021/cant-use-my-login-password-for-su-postgres-in-terminal
#    #
#    su postgres -c 'createuser -dRS vagrant'
#    #
#    # the following will prompt for appuser's password.
#    #
#    su postgres -c 'createuser -drsP appuser'
#    #
#    su vagrant -c 'createdb'
#    su vagrant -c 'createdb catalog'
#    su vagrant -c 'psql catalog -f /vagrant/create_tables.sql'

    vagrantTip="[35m[1mThe shared directory is located at /vagrant\\nTo access your shared files: cd /vagrant[m"
    echo -e $vagrantTip > /etc/motd

    # wget http://download.redis.io/redis-stable.tar.gz
    # tar xvzf redis-stable.tar.gz
    # cd redis-stable
    # make
    # make install

    echo "Done installing your virtual machine!"
  SHELL
end
