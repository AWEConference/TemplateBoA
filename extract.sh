#!/bin/bash
qpdf --empty --pages book.pdf $1-$2 -- AWEC$3.pdf
