# Deployment

## Build and push an image to repository

        export AWS_PROFILE=openpath

        # set version
        date --iso-8601 | tr -d '\n' > .version
        echo -n -- >> .version
        git rev-parse --short HEAD | tr -d '\n' >> .version
        export VERSION=$(cat .version)

        export REGISTRY_ID=`aws ecr describe-repositories | jq '.repositories[0].registryId' | sed -e 's/"//g'`
        export REPO=$REGISTRY_ID.dkr.ecr.us-east-1.amazonaws.com/open-path-warehouse
        export IMAGE=${REPO}:${VERSION}
        export NAMESPACE=qa-production
        echo $IMAGE

        ./build.sh

        cat k8s/deployment.yml | envsubst | kubectl apply -f -
