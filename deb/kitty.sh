cd ~/apps

if [ ! -d "kitty" ]; then
  git clone https://github.com/kovidgoyal/kitty
fi

cd kitty

git co v0.19.2

sudo apt-get install liblcms2-dev

make

ln -sfrv ./kitty/launcher/kitty ~/apps/local/bin

kitty --version
