#!/usr/bin/env bash

set -e -o pipefail

if ! command -v swag &> /dev/null ; then
    echo "swag not installed or available in the PATH" >&2
    exit 1
fi

exec 5>&1
output="$(swag fmt ./... | tee /dev/fd/5)"
[[ -z "$output" ]]
