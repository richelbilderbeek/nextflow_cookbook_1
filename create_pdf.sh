#!/bin/bash
#
# Create the PDF 'nextflow_cookbook_1.pdf'
#
# It does so by converting the TeX to PDF, 
# as well as stitching some other PDFs to it
#
# Usage:
#
#   ./create.sh
#
rm -f nextflow_cookbook_1.pdf

pdflatex nextflow_cookbook_1.tex
bibtex nextflow_cookbook_1 >/dev/null
pdflatex nextflow_cookbook_1.tex >/dev/null
pdflatex nextflow_cookbook_1.tex

