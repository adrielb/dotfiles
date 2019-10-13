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
  PyQt5 \
  matplotlib \
  scipy \
  scikit-learn \
  pylama \
  flake8 \
  pylint \
  vim-vint \
  pandas \
  pandas-datareader \
  ipython \
  pytest \
  numexpr \
  cython \
  statsmodels \
  moviepy \
  seaborn \
  pynvim \
  neovim-remote \
  gitpython \
  jupyter \
  jupyter_contrib_nbextensions \
  jupyterlab \
  jupytext \
  proselint \
  youtube-dl \
  beautifulsoup4 \
  python-language-server \
  xlrd \
  joblib \
  bokeh \
  holoviews \
  fastparquet \
  mypy \
  dask[complete] \
  attrs \
  cvxpy \
  julia \
  yamllint \
  flask \
  # http://download.pytorch.org/whl/cpu/torch-0.4.0-cp36-cp36m-linux_x86_64.whl 
  # torchvision

  # h5py \
  # tables \
  # jupyterlab \
  # pyglet \
  # tensorflow \
  # pyro-ppl \
  # edward \
  # keras \
  # spacy \
  # sympy \
  # prettyplotlib \
  # mpld3 \
  # lxml \
  # patsy \
  # pyyaml \
  # jinja2 \

# python -m spacy.en.download all

cd ~/.local/lib/python3.7/site-packages
ctags-exuberant -R --totals=yes --languages=python
