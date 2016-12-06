#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.11.0-cp35-cp35m-linux_x86_64.whl

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
  neovim \
  keras \
  spacy \
  edward \
  $TF_BINARY_URL

  # prettyplotlib \
  # mpld3 \
  # lxml \
  # patsy \
  # pyyaml \
  # jinja2 \

# python -m spacy.en.download all

