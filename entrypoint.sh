#!/bin/bash
PROJECT=$1
REPOSITORY=$2
JSON_KEY=$3
echo "$JSON_KEY" > /tmp/key.json
# SERVICE_ACCOUNT=$(jq .client_email /tmp/key.json | tr -d '"')
# gcloud auth activate-service-account $SERVICE_ACCOUNT --key-file=/tmp/key.json --project=$PROJECT
# IMAGES=$(gcrane ls ${REPOSITORY} | tr '\n' ',')
# echo "${IMAGES%,}"
# # IMAGES=$(gcrane ls us-central1-docker.pkg.dev/endor-ci/private --json | jq .child[] | tr "\n" ",")
# # echo "matrix=$(jq -Rsc '{image : split("\n")[:-1]}' <<< $IMAGES)"
# # echo "matrix=$(jq -Rsc '{image : split("\n")[:-1]}' <<< $IMAGES)" >> $GITHUB_OUTPUT
# echo "matrix=${IMAGES%,}" >> $GITHUB_OUTPUT
echo '{"matrix":[{"image":"us-central1-docker.pkg.dev/endor-ci/private/analyticapiserver"},{"image":"us-central1-docker.pkg.dev/endor-ci/private/apiserver"},{"image":"us-central1-docker.pkg.dev/endor-ci/private/auditlogapiserver"},{"image":"us-central1-docker.pkg.dev/endor-ci/private/docserver"},{"image":"us-central1-docker.pkg.dev/endor-ci/private/endorci_runner"},{"image":"us-central1-docker.pkg.dev/endor-ci/private/endorctl_base"},{"image":"us-central1-docker.pkg.dev/endor-ci/private/endorstats"},{"image":"us-central1-docker.pkg.dev/endor-ci/private/grpcgateway"},{"image":"us-central1-docker.pkg.dev/endor-ci/private/k8s-maintenance"},{"image":"us-central1-docker.pkg.dev/endor-ci/private/metadataapiserver"},{"image":"us-central1-docker.pkg.dev/endor-ci/private/metadataretriever"},{"image":"us-central1-docker.pkg.dev/endor-ci/private/migrationservice"},{"image":"us-central1-docker.pkg.dev/endor-ci/private/queryapiserver"},{"image":"us-central1-docker.pkg.dev/endor-ci/private/scheduler"},{"image":"us-central1-docker.pkg.dev/endor-ci/private/secretservice"},{"image":"us-central1-docker.pkg.dev/endor-ci/private/vulnerabilityapiserver"},{"image":"us-central1-docker.pkg.dev/endor-ci/private/vulnerabilityingestor"},{"image":"us-central1-docker.pkg.dev/endor-ci/private/webserver"}]}' >> $GITHUB_OUTPUT
