#!/usr/bin/env bash

VERSIONS_FILE=versions.json
VERSION=$1

function ver {
  printf "%03d%03d%03d" $(echo "$1" | tr '.' ' ');
}

if [ -z "$VERSION" ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

if [ "$(ver "${VERSION}")" -le "$(ver "$(jq -r '.latest' "${VERSIONS_FILE}")")" ]; then
  echo "Version must be greater than $(jq -r '.latest' "${VERSIONS_FILE}")"
  exit 1
fi

VERSIONS=$(jq --arg version "${VERSION}" '.latest |= $version' "${VERSIONS_FILE}")

echo "${VERSIONS}" > "${VERSIONS_FILE}"
