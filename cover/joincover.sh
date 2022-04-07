#!/bin/bash
pdfunite cover.pdf cover-maps.pdf c.pdf
mv -f c.pdf cover.pdf
rm -f c.pdf
