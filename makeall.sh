#!/bin/sh
pdflatex book.tex
makeindex book.idx
pdflatex book.tex
pdflatex book.tex
