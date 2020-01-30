#!/bin/bash

./set_version.sh

export AWS_PROFILE=openpath

echo Building deployable image

git rev-parse HEAD > REVISION

#WIP check for uncommited files.

docker build \
  --file=./Dockerfile \
  --tag open-path-warehouse:latest \
  ../..

echo log in to ECR: Elastic Container Registry
$(aws ecr get-login --no-include-email --region us-east-1)

echo tagging this last build
docker tag open-path-warehouse:latest $IMAGE

docker image ls -f 'label=host.openpath.app=open-path-warehouse'

echo Push image to repository.
echo This is supposed to fail if you forgot to change the version from a previous push
echo The first push after big changes may be slow
docker push $IMAGE

echo clean up
docker image prune
