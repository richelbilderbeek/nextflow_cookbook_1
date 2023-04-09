#/bin/bash
mousepad \
  nextflow_cookbook_1.tex \
  nextflow_cookbook_1_chapter_1.tex \
  nextflow_cookbook_1_chapter_2.tex 

./create_pdf.sh

FILE=nextflow_cookbook_1.pdf
if test -f "$FILE"; then
  evince "$FILE"
fi



