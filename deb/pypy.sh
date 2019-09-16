cd ~/apps

hg clone https://bitbucket.org/pypy/pypy

hg update py3.5

apt-get install gcc make libffi-dev pkg-config zlib1g-dev libbz2-dev \
libsqlite3-dev libncurses5-dev libexpat1-dev libssl-dev libgdbm-dev \
tk-dev libgc-dev python-cffi \
liblzma-dev libncursesw5-dev 

cd pypy/pypy/goal

pypy ../../rpython/bin/rpython -Ojit targetpypystandalone 
