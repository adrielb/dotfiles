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
  vim-vint \
  pandas \
  pandas-datareader \
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
  gitpython \
  keras \
  spacy \
  pyglet \
  tensorflow \
  jupyter \
  jupyter_contrib_nbextensions \
  edward \
  proselint \
  youtube-dl \
  beautifulsoup4 \
  jupyterlab \
  pyro-ppl \
  python-language-server \
  xlrd \
  joblib \
  dash \
  dash-renderer \
  dash-core-components \
  dash-html-components \
  bokeh \
  holoviews \
  # http://download.pytorch.org/whl/cpu/torch-0.4.0-cp36-cp36m-linux_x86_64.whl 
  # torchvision

  # prettyplotlib \
  # mpld3 \
  # lxml \
  # patsy \
  # pyyaml \
  # jinja2 \

# python -m spacy.en.download all

cd ~/.local/lib/python3.6/site-packages
ctags-exuberant -R --totals=yes --languages=python
