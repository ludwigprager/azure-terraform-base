#!/usr/bin/env bash

set -eu

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$DIR/20-tf-backend/10-apply.sh
$DIR/30-main/10-apply.sh
