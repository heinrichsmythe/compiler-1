#!/usr/bin/env bash

for PROJECT in $(find . -mindepth 1 -maxdepth 1 -type d); do

  cd "${PROJECT}"
  node ../../cli/index.js &>/dev/null
  if ! cmp -s out.js expected-out.js; then
    echo "${PROJECT} failed: compare out.js and expected-out.js"
  fi
  cd ..

done
