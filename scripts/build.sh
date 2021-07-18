#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

brew install jfrog-cli

jfrog c add -f artifactory \
    --url="${artifactory_base_url}" \
    --user="${artifactory_username}" \
    --access-token="${artifactory_password}" \
    --artifactory-url="${artifactory_base_url}/artifactory" \
    --interactive=false

jfrog rt \
    gradle clean \
    artifactoryPublish -b build.gradle \
    --build-name=v1beta2-demo-2-muG79 \
    --build-number=1 \
    -Pversion=1.1.0
