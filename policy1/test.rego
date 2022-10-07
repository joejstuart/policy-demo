package main

deny[msg] {
  input.kind == "Deployment"
  not input.spec

  msg := "Must have spec defined"
}
