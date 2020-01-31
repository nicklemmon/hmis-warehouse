#!/bin/bash

# abort on first error
set -e

./set_version.sh

if [[ `git status --porcelain` != '' ]]; then
  echo Aborting since git is not clean
  exit 1
fi

export AWS_PROFILE=openpath

echo Building deployable image

git rev-parse HEAD > REVISION

#WIP check for uncommited files.

docker build \
  --file=./Dockerfile \
  --tag open-path-warehouse:latest \
  ../..

# Log in to ECR: Elastic Container Registry
# This lets you push using docker directly if you need that
#$(aws ecr get-login --no-include-email --region us-east-1)

echo tagging this last build
docker tag open-path-warehouse:latest $IMAGE

docker image ls -f 'label=host.openpath.app=open-path-warehouse'

echo Push image to repository.
echo This is supposed to fail if you forgot to change the version from a previous push
echo The first push after big changes may be slow
#docker push $IMAGE
ecs-cli push --ecs-profile=openpath $IMAGE

echo clean up
docker image prune
