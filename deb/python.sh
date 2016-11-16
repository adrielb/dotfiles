#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

# easy_install -U distribute
pip install --user --upgrade \
  pip \
  jedi \
  pyzmq \
  numpy \
  matplotlib \
  scipy \
  scikit-learn \
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
  Theano \
  neovim \
  keras \
  spacy \


  # prettyplotlib \
  # mpld3 \
  # lxml \
  # patsy \
  # pyyaml \
  # jinja2 \

# python -m spacy.en.download all


export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.11.0-cp35-cp35m-linux_x86_64.whl

pip3 install --user --upgrade $TF_BINARY_URL


