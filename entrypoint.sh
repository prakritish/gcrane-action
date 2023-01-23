#!/bin/bash
PROJECT=$1
REPOSITORY=$2
JSON_KEY=$3
echo "$JSON_KEY" > /tmp/key.json
SERVICE_ACCOUNT=$(jq .client_email /tmp/key.json | tr -d '"')
gcloud auth activate-service-account $SERVICE_ACCOUNT --key-file=/tmp/key.json --project=$PROJECT
# IMAGES=$(gcrane ls ${REPOSITORY} | tr "\n" " ")
# echo "$IMAGES"
# my_images=$(jq -n --arg images "$IMAGES" '{"images": $images | split("\n")}')
IMAGES=$(gcrane ls us-central1-docker.pkg.dev/endor-ci/private --json | jq .child[] | tr "\n" " ")
echo "images=${IMAGES%,}" >> $GITHUB_OUTPUT
