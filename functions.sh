#!/usr/bin/env bash


get-account-key() {
  local ACCOUNT_KEY=$(az storage account keys list \
    --resource-group $RESOURCE_GROUP_NAME \
    --account-name $STORAGE_ACCOUNT_NAME \
    --query '[0].value' -o tsv)

  if [[ ! -z ${ACCOUNT_KEY} ]]; then
    printf ${ACCOUNT_KEY}
  fi
}
export -f get-account-key


get-subscription-id() {
  local SUBSCRIPTION_ID=$(az account list -o json | jq -r .[].id)

  if [[ ! -z ${SUBSCRIPTION_ID} ]]; then
    printf ${SUBSCRIPTION_ID}
  fi
}
export -f get-subscription-id
