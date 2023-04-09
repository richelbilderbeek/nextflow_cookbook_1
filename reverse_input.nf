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
  result_ch = reverse_input(text_ch)
  show_output(result_ch)
}
