#!/usr/bin/env bash

set -eu

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

source ../set-env.sh

exists=$(az group exists -n $RESOURCE_GROUP_NAME)
if [[ $exists != "true" ]]; then
  echo "creating resource group $RESOURCE_GROUP_NAME"
  az group create \
    --name $RESOURCE_GROUP_NAME \
    --location eastus
else
  echo "resource group $RESOURCE_GROUP_NAME already exists"
fi

available=$(az storage account check-name  --name $STORAGE_ACCOUNT_NAME | jq -r .nameAvailable )
if [[ $available != "false" ]]; then
  echo "creating storage account $STORAGE_ACCOUNT_NAME"
  az storage account create \
    --resource-group $RESOURCE_GROUP_NAME \
    --name $STORAGE_ACCOUNT_NAME \
    --sku Standard_LRS \
    --encryption-services blob
else
  echo "storage account $STORAGE_ACCOUNT_NAME already exists"
fi

#if [[ -z $(az storage file exists -p ${path}) ]]; then
#    echo "File exists"
#else 
#    echo "File does not exist"
#fi

source ../functions.sh
export ARM_ACCESS_KEY=$(get-account-key)


exists=$(az storage container exists \
  --name $CONTAINER_NAME \
  --account-name $STORAGE_ACCOUNT_NAME \
  --auth-mode key \
  --account-key $ARM_ACCESS_KEY | jq -r .exists )

if [[ $exists != "true" ]]; then

  echo "creating blob container $STORAGE_ACCOUNT_NAME"
  az storage container create \
    --name $CONTAINER_NAME \
    --account-name $STORAGE_ACCOUNT_NAME \
    --auth-mode key \
    --account-key  $ARM_ACCESS_KEY \
    --only-show-errors

else
  echo "storage container $CONTAINER_NAME already exists"
fi
