#!/usr/bin/env bash

set -eu

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source functions.sh

azcli ./20-tf-backend/10-apply.sh
./30-main/10-apply.sh
