#!/usr/bin/env bash


export RESOURCE_GROUP_NAME=tfstate
# The name of the Azure Storage account.
export STORAGE_ACCOUNT_NAME="staatp202211131751"
# The name of the blob container.
export CONTAINER_NAME=tfstate
# The name of the state store file to be created.
#KEY=tfstate

# name of keyvault - must be globally unique
# I'd suggest to use the current data & time
export TF_VAR_keyvault_name="atp-vault-202104131751"

# name of storage account - must be globally unique
# I'd suggest to use the current data & time
export TF_VAR_sta_name=$STORAGE_ACCOUNT_NAME

export TF_VAR_access_key_secret_name="storage-access-key"
export TF_VAR_sta_rg_location="West Europe"

# display-name of the auto-generated app - mandatory but pretty irrelevant
display_name=sp-atp

# --- neu

#SUBSCRIPTION_ID="a54bd3a9-2d43-4dee-9bd8-592b0274dccd"

