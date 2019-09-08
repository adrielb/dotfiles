# https://github.com/gohugoio/hugo/releases

cd /tmp

URL=https://github.com/gohugoio/hugo/releases/download/v0.58.1/hugo_0.58.1_Linux-64bit.tar.gz

wget $URL

tar zxvf *.tar.gz

hugo version

mv hugo ~/.local/bin

hugo version

