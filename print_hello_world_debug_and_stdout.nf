process say_hello {
  debug true

  output:
  stdout

  '''
  echo "Hello world"
  '''
}

workflow {
  say_hello().view{ it }
}
