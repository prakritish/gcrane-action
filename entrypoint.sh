#!/bin/bash
PROJECT=$1
REPOSITORY=$2
SERVICE_ACCOUNT=$3
JSON_KEY=$4
echo "$JSON_KEY" > /tmp/key.json
gcloud auth activate-service-account $SERVICE_ACCOUNT --key-file=/tmp/key.json --project=$PROJECT
IMAGES=$(gcrane ls ${REPOSITORY})
echo "images=${IMAGES}" >> $GITHUB_OUTPUT
