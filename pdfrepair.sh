#!/bin/sh
gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -DsAFER -sOutputFile=tmp.pdf $1
mv -f tmp.pdf $1
