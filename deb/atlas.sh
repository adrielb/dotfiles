cd /root
mkdir atlas

apt-get source atlas
apt-get build-dep atlas
apt-get install devscripts

cpufreq-info
# ondemand --> performance

# for each cpu
cpufreq-set -g performance -c 0 
cpufreq-set -g performance -c 1
cpufreq-set -g performance -c 2 
cpufreq-set -g performance -c 3 
cpufreq-set -g performance -c 4 
cpufreq-set -g performance -c 5 
cpufreq-set -g performance -c 6 
cpufreq-set -g performance -c 7 

cd atlas-3.10.2
fakeroot debian/rules custom
cd ..

dpkg -i libatlas3-base_3.10.2-7+custom1_amd64.deb

dpkg -i libatlas3-base_<version>.deb

update-alternatives --config libblas.so.3
