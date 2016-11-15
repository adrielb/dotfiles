#!/bin/bash
set -o pipefail # exit status 0 only if all cmds 0
set -e # exit immediately upon failure
set -x # log all cmds before executing

if [ ! $( id -u ) -eq 0 ]; then
    echo "Please enter root's password."
    exec su -c "${0}" # Call this prog as root
    exit ${?}  # sice we're 'execing' above, we wont reach this exit
               # unless something goes wrong.
fi

easy_install -U distribute
pip install jinja2
pip install --user --upgrade jedi
pip install pyzmq
pip install numpy
pip install --user --upgrade matplotlib
pip install scipy
pip install --user --upgrade scikit-learn
pip install pylint
pip install pandas
pip install --user --upgrade ipython
pip install --user --upgrade pytest
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
pip install keras

pip install --user -U spacy
python -m spacy.en.download all


export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.11.0-cp35-cp35m-linux_x86_64.whl

pip3 install --user --upgrade $TF_BINARY_URL


