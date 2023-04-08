process say_hello {
  debug true

  '''
  echo "Hello world"
  '''
}

workflow {
  say_hello()
}
