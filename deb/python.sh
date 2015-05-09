#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing


easy_install -U distribute
pip install jinja2
pip install jedi
pip install pyzmq
pip install numpy
pip install matplotlib
pip install scipy
pip install scikit-learn
pip install pylint
pip install pandas
pip install ipython
pip install sympy
pip install numexpr
pip install cython
pip install tables
pip install h5py
pip install pyyaml
pip install patsy
pip install statsmodels
pip install moviepy
pip install lxml
pip install seaborn
pip install mpld3
pip install prettyplotlib
pip install Theano
pip install neovim
