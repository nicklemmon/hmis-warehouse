#!/bin/bash

echo Building deployable image

git rev-parse HEAD > REVISION

docker build \
  --file=./Dockerfile \
  --tag open-path:latest \
  ../..
