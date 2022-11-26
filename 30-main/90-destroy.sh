#!/usr/bin/env bash

set -eu

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR
source ../set-env.sh
source ./set-env.sh

envsubst < backend.tf.tpl > backend.tf

source ../functions.sh
export ARM_ACCESS_KEY=$(get-account-key)

terraform init

terraform destroy -auto-approve

