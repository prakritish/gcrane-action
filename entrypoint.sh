#!/bin/bash
PROJECT=$1
REPOSITORY=$2
JSON_KEY=$3
echo "$JSON_KEY" > /tmp/key.json
SERVICE_ACCOUNT=$(jq .client_email /tmp/key.json | tr -d '"')
gcloud auth activate-service-account $SERVICE_ACCOUNT --key-file=/tmp/key.json --project=$PROJECT
IMAGES=$(gcrane ls ${REPOSITORY})
echo "$IMAGES"
my_images=$(jq -n --arg images "$IMAGES" '{"images": $images | split("\n")}')
echo "images=${my_images}" >> $GITHUB_OUTPUT
