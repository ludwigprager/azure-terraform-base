#!/usr/bin/env bash

set -eu

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

source ../set-env.sh

#az storage container delete \
#  --name $CONTAINER_NAME

az storage account delete \
  --resource-group $RESOURCE_GROUP_NAME \
  --name $STORAGE_ACCOUNT_NAME \
  --yes | true

az group delete \
  --name $RESOURCE_GROUP_NAME \
  --yes
