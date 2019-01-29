
mkdir -p ~/apps/picat
cd ~/apps/picat

wget http://picat-lang.org/download/picat25_linux64.tar.gz
tar zxvf picat25_linux64.tar.gz
cd Picat


cd ~/apps/local/bin
ln -sf ~/apps/picat/Picat/picat
