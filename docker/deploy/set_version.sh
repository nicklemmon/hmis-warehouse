#!/bin/bash

export AWS_PROFILE=openpath

# set version
date "+%Y-%m-%d" | tr -d '\n' > .version
echo -n -- >> .version
git rev-parse --short HEAD | tr -d '\n' >> .version
export VERSION=$(cat .version)
echo $VERSION

export REGISTRY_ID=`aws ecr describe-repositories | jq '.repositories[0].registryId' | sed -e 's/"//g'`
export REPO=$REGISTRY_ID.dkr.ecr.us-east-1.amazonaws.com/open-path-warehouse
export IMAGE=${REPO}:${VERSION}
export NAMESPACE=qa-production
echo $IMAGE