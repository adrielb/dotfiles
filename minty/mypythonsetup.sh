set -e -x

#mkdir /apps
#chown minty:minty /apps
apt-get install -y libpng-dev libfreetype6 libfreetype6-dev \
  libblas-dev liblapack-dev gfortran \
  mercurial libncurses-dev cscope \
  libgtk2.0-dev libxt-dev \
  lua5.2-dev ruby-dev tcl-dev lua5.2 ruby tcl \
  python-dev python-pip
easy_install -U distribute
pip install numpy
pip install matplotlib
pip install scipy
pip install scikit-learn
pip install pylint pandas ipython
