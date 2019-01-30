
cd ~/apps/minizinc

wget https://github.com/MiniZinc/MiniZincIDE/releases/download/2.2.3/MiniZincIDE-2.2.3-bundle-linux-x86_64.tgz

tar zxvf MiniZincIDE-2.2.3-bundle-linux-x86_64.tgz

ln -sf MiniZincIDE-2.2.3-bundle-linux current

cd ~/apps/local/bin
ln -sf ~/apps/minizinc/current/bin/minizinc

