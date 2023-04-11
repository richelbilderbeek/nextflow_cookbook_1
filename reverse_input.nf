// nextflow run reverse_input.nf --text "Hello world"

params.text = '' 

process show_input {
  debug true

  input:
  val text

  output:
  stdout

  script:
  """
  echo "Input: ${text}"
  """
}

process check_input {
  debug true

  input:
  val text

  output:
  stdout

  script:
  """
  #!/bin/bash

  if [[ -n ${text} ]]; 
  then 
    echo "No 'text' argument found, please run with 'nextflow run reverse_input.nf --text Hello'"
    exit 42
  fi
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

process reverse_input {

  input:
  val text

  output:
  stdout

  script:
  """
  echo ${text} | rev
  """
}

workflow {
  text_ch = Channel.of(params.text)
  show_input(text_ch)
  check_input(text_ch)
  result_ch = reverse_input(text_ch)
  show_output(result_ch)
}
