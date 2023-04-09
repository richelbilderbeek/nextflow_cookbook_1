process say_hello {
  output:
  stdout

  '''
  echo "Hello world"
  '''
}

workflow {
  say_hello().view{ it }
}
