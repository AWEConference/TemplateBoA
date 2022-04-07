#!/bin/sh
find ./ -name '*~' -exec rm -f {} \;
find ./ -name '*.aux' -exec rm -f {} \;
find ./ -name '*.bbl' -exec rm -f {} \;
find ./ -name '*.blg' -exec rm -f {} \;
find ./ -name '*.bcf' -exec rm -f {} \;
find ./ -name '*.log' -exec rm -f {} \;
\rm -fr *.dvi *.toc *.aux *.blg *.lof *.log *.lot *.out *.ilg *.ind *.run.xml book.synctex.gz pdfa.xmpi
