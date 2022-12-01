#!/bin/bash

gnuplot < 52wks_ita.gnuplot
ps2pdf13 -dEPSCrop 52wk.eps 52wk.pdf
pdflatex a5.tex
