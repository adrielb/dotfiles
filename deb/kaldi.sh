#!/bin/bash
source ./logger.sh

cd ${APPS}
if [ ! -d "kaldi" ]; then
	git clone https://github.com/kaldi-asr/kaldi.git 
fi

cd kaldi/tools

make

cd ../src

./configure

make clean -j
make depend -j
make -j 4
