package main

deny[msg] {
  input.kind == "Deployment"
  not input.spec.template

  msg := "Must have template defined"
}
