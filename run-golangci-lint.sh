#!/usr/bin/env bash

if ! command -v golangci-lint 2>&1 /dev/null ; then
    echo "golangci-lint not installed or available in the PATH" >&2
    echo "please check https://github.com/golangci/golangci-lint" >&2
    exit 1
fi

CONFIG_FILE="$1"
ERRS=$(golangci-lint run --new-from-rev="$(git rev-parse HEAD)" "$CONFIG_FILE")

if [ -n "${ERRS}" ]; then
    echo "${ERRS}"
    exit 1
fi
exit 0
