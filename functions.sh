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

azcli() {
  local C_TOOL=docker
  local IMAGE=mcr.microsoft.com/azure-cli:2.61.0

  if [ $# -eq 0 ]; then
    COMMAND="/bin/bash"
  else
    COMMAND=$*
  fi


#   -v ${HOME}/.kube/kubeconfig:/tooling/config/kube/config \
#   --network=host \

  ${C_TOOL} run -ti \
    --rm \
    -w /work/ \
    -v $(pwd):/work/ \
    -v ${HOME}/.azure/:/.azure/ \
    -e AZURE_CONFIG_DIR='/.azure/' \
    ${IMAGE} \
    ${COMMAND}
}
export -f azcli
