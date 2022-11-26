#!/usr/bin/env bash

set -eu
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $BASEDIR

source ./functions.sh
source ./set-env.sh
SUBSCRIPTION_ID=$(get-subscription-id)
#source ./set-env.sh

echo
echo "resource groups:  https://portal.azure.com/#@celp.de/resource/subscriptions/${SUBSCRIPTION_ID}/resourceGroups"
echo "storage accounts: https://portal.azure.com/#view/HubsExtension/BrowseResource/resourceType/Microsoft.Storage%2FStorageAccounts"
echo "containers:       https://portal.azure.com/#@celp.de/resource/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/tfstate/providers/Microsoft.Storage/storageAccounts/${STORAGE_ACCOUNT_NAME}/containersList"
echo "subscription:     https://portal.azure.com/#@celp.de/resource/subscriptions/${SUBSCRIPTION_ID}/overview"

#echo "service accounts: https://console.cloud.google.com/iam-admin/serviceaccounts?project=${PROJECT_ID}"
#echo "permissions:      https://console.cloud.google.com/iam-admin/iam?project=${PROJECT_ID}"
echo
