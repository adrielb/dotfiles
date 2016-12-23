
VER="7.3.0"
NODEXZ="node-v"$VER"-linux-x64.tar.xz"

cd ~/apps/nodejs

wget https://nodejs.org/dist/v$VER/$NODEXZ

tar xvf $NODEXZ

npm update --global

npm install --global tern

npm install --global jshint

npm install --global eslint

npm list --global

npm ls --global minimatch
npm ls --global minimatch@0.3.0
npm ls --global minimatch@0.2.14

npm install --global minimatch

npm outdated --global 
