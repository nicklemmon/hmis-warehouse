# Deployment

## Build and push an image to repository

        export AWS_PROFILE=openpath
        export VERSION=0.0.3
        export REGISTRY_ID=`aws ecr describe-repositories | jq '.repositories[0].registryId' | sed -e 's/"//g'`
        export REPO=$REGISTRY_ID.dkr.ecr.us-east-1.amazonaws.com/open-path-warehouse
        export IMAGE=${REPO}:${VERSION}

        ./build.sh

        cat k8s/deployment.yml | envsubst | kubectl apply -f -
