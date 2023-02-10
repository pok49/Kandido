#!/bin/bash
set -xe

# alias fb2lint='xmllint --noout --schema ~/Dropbox/Books/fb2-spec/trunk/fb2-perl-tools/XSD/FB2.1/FictionBook2.1.xsd'

rm -f Kandid*.pdf Kandid*.fb2pdf.log
sed -Ef fb2.sed Kandido.fb2 > ka.fb2 && \
    xmllint --noout --schema ~/Dropbox/Books/fb2-spec/trunk/fb2-perl-tools/XSD/FB2.1/FictionBook2.1.xsd ~/Git/Kandido/ka.fb2 && \
    ~/Documents/Books/fb2pdf-j.20180924/fb2pdf.sh ka.fb2 -e 'utf8' -o Kandido.pdf
