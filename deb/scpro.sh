#!/bin/bash
FONT_NAME="SourceCodePro"
URL="http://sourceforge.net/projects/sourcecodepro.adobe/files/latest/download"
wget http://downloads.sourceforge.net/project/sourcecodepro.adobe/SourceCodePro_FontsOnly-1.017.zip


mkdir /tmp/adodefont
cd /tmp/adodefont
wget ${URL} -O ${FONT_NAME}.zip
unzip -o -j ${FONT_NAME}.zip
mkdir -p ~/.fonts
cp *.otf* ~/.fonts
fc-cache -f -v
