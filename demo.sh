#!/usr/bin/env bash

REGISTRY=jstuart-registry
REG_SERVER=jstuartregistry.azurecr.io

# login to azure container registry
registry_login() {
  az acr login --name $REGISTRY
}

# get the registry server name
get_registry_server() {
  az acr show --name $REGISTRY --query loginServer --output table
}

conftest_push() {
  conftest push "${REG_SERVER}/${1}:latest" -p $1
}

list_images() {
  az acr repository list --name $REGISTRY --output table
}

show_tags() {
  az acr repository show-tags --name $REGISTRY --repository $1 --output table
}
