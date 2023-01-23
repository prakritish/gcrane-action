#!/bin/bash
PROJECT=$1
REPOSITORY=$2
TAG=$3
JSON_KEY=$4
echo "$JSON_KEY" > /tmp/key.json
SERVICE_ACCOUNT=$(jq .client_email /tmp/key.json | tr -d '"')
gcloud auth activate-service-account $SERVICE_ACCOUNT --key-file=/tmp/key.json --project=$PROJECT
IMAGES=$(gcrane ls ${REPOSITORY})
IMAGE_LIST=()
for image in $IMAGES
do
    gcrane manifest ${image}:${TAG} >/dev/null 2>&1 && IMAGE_LIST+=(${image})
done
echo "matrix=$(jq -Rsc 'split(" ")' <<< ${IMAGE_LIST[@]} | sed 's/\\n//g')"
echo "matrix=$(jq -Rsc 'split(" ")' <<< ${IMAGE_LIST[@]} | sed 's/\\n//g')" >> $GITHUB_OUTPUT
