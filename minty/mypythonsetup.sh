set -e -x

#mkdir /apps
#chown minty:minty /apps
apt-get install libpng-dev libfreetype6 libfreetype6-dev \
  libblas-dev liblapack-dev gfortran \
  mercurial libncurses-dev cscope \
  libgtk2.0-dev libxt-dev \
  lua5.2-dev ruby-dev tcl-dev lua5.2 ruby tcl \
  python-pip
pip install numpy
pip install matplotlib
pip install distribute
pip install scipy
pip install scikit-learn
pip install pylint pandas ipython
