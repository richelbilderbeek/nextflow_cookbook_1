// nextflow run reverse_input.nf --input_filename my_file.tex

params.input_filename = '' 

process show_input_filename {
  debug true

  input:
  val input_filename

  output:
  stdout

  script:
  """
  echo "Input filename: ${input_filename}"
  """
}

process show_output {
  debug true

  input:
  val text

  output:
  stdout

  script:
  """
  echo "Output: ${text}"
  """
}

process spell_check {

  input:
  val input_filename

  output:
  stdout

  script:
  """
  cat ${input_filename} | aspell pipe --mode=tex --lang=en_GB
  """
}

workflow {
  input_filename_ch = Channel.of(params.input_filename)
  show_input_filename(input_filename_ch)
  result_ch = spell_check(input_filename_ch)
  show_output(result_ch)
}
