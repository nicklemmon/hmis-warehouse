#!/bin/bash

echo Untested. This was just a copy of something that worked while hacking (ecs)

exit 0

source .env

echo log in to registry
$(aws --profile=greenriver ecr get-login --no-include-email --region us-east-1)

echo build locally
docker build -t test-rails .

echo tag
VERSION=0.0.3
docker tag test-rails:latest 109149673510.dkr.ecr.us-east-1.amazonaws.com/test-rails:$VERSION

echo push to repository
docker push 109149673510.dkr.ecr.us-east-1.amazonaws.com/test-rails:$VERSION
