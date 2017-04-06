#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

# easy_install -U distribute
pip3 install --user --upgrade \
  pip \
  virtualenv \
  jedi \
  pyzmq \
  numpy \
  matplotlib \
  scipy \
  scikit-learn \
  pylama \
  flake8 \
  pylint \
  pandas \
  ipython \
  pytest \
  sympy \
  numexpr \
  cython \
  tables \
  h5py \
  statsmodels \
  moviepy \
  seaborn \
  neovim \
  keras \
  spacy \
  pyglet \
  tensorflow \
  jupyter \
  edward \

pip3 install --user --upgrade http://download.pytorch.org/whl/cu75/torch-0.1.11.post5-cp36-cp36m-linux_x86_64.whl
pip3 install --user --upgrade torchvision

  # prettyplotlib \
  # mpld3 \
  # lxml \
  # patsy \
  # pyyaml \
  # jinja2 \

# python -m spacy.en.download all

cd ~/.local/lib/python3.6/site-packages
ctags-exuberant -R --totals=yes --languages=python
