#!/bin/bash
LOCATION=$1
PROJECT=$2
REPOSITORY_LIST=$3
TAG=$4
JSON_KEY=$5
echo "$JSON_KEY" > /tmp/key.json
SERVICE_ACCOUNT=$(jq .client_email /tmp/key.json | tr -d '"')
gcloud auth activate-service-account $SERVICE_ACCOUNT --key-file=/tmp/key.json --project=$PROJECT
IMAGE_LIST=()
for repository in ${REPOSITORY_LIST}
do
    REPOSITORY=${LOCATION}-docker.pkg.dev/${PROJECT}/${repository}
    IMAGES=$(gcrane ls ${REPOSITORY})
    for image in $IMAGES
    do
        gcrane manifest ${image}:${TAG} >/dev/null 2>&1 && IMAGE_LIST+=(${image})
    done
done
echo "matrix=$(jq -Rsc 'split(" ")' <<< ${IMAGE_LIST[@]} | sed 's/\\n//g')"
echo "matrix=$(jq -Rsc 'split(" ")' <<< ${IMAGE_LIST[@]} | sed 's/\\n//g')" >> $GITHUB_OUTPUT
