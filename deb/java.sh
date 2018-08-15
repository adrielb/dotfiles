apt-get install dirmngr

echo "deb http://ppa.launchpad.net/linuxuprising/java/ubuntu bionic main" | tee /etc/apt/sources.list.d/linuxuprising-java.list

# problem adding key, deleting trusted.gpg worked
# https://serverfault.com/questions/851724/apt-key-add-on-debian-stretch-no-valid-openpgp-data-found
mv /etc/apt/trusted.gpg /etc/apt/trusted.gpg.old

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 73C3DB2A

# gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 73C3DB2A

# gpg --export --armor 73C3DB2A | apt-key add -


# apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886

apt-get update

apt-get install oracle-java8-installer

apt-get install oracle-java10-installer

apt-get install oracle-java10-set-default



# java 8
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

apt-get update

apt-get install oracle-java8-installer

apt-get install oracle-java8-set-default


# switching
update-alternatives --config java
