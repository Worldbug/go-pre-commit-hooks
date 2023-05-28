#!/usr/bin/env bash

for DIR in $(echo "$@"|xargs -n1 dirname|sort -u); do
    staticcheck ./"$DIR"
done
