#!/bin/bash
#
# Lint a Nextflow script
#
# Usage:
#
#   ./lint_nf.sh [nextflow file]
#
if [ "$#" -ne 1 ]; then
  echo "Invalid number of parameters."
  echo "Number of parameters needed: 1"
  echo "Number of parameters given: $#"
  echo " "
  echo "Example use: "
  echo " "
  echo "  ./lint_nf.sh print_hello_world.nf"
  echo " "
  exit 42
fi

filename=$1
echo "Filename: $filename"

if [ ! -e "$filename" ]
then 
  echo "Error: Filename '$filename' does not exist."
  exit 43
fi

temp_lint_foldername=temp_lint

echo "Create the linter working directory '$temp_lint_foldername'"
nf-core create --name templint --description "Temporary pipeline for linting" --author "Richel J.C. Bilderbeek" --no-git --plain --outdir $temp_lint_foldername --force

echo "Copy '$filename' to linter working directory '$temp_lint_foldername/main.nf'"
cp -f $filename $temp_lint_foldername/main.nf

echo "Change to the linter working directory '$temp_lint_foldername'"
cd $temp_lint_foldername

echo "Run nf-core lint"
nf-core lint


