cd ~/apps

git clone git@github.com:jwilm/alacritty.git

cd alacritty

curl https://sh.rustup.rs -sSf | sh

cargo install cargo-deb

cargo deb --install


cargo build --release

apt search libfreetype6

su -

apt-get install libfreetype6-dev libfontconfig1-dev
