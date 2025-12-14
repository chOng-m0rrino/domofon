#!/bin/bash
set -ev

VERSION=`cat config.json | jq -r '.version'`

echo "Running build for $VERSION"

docker buildx build --progress=plain --pull --push -t wlad1164/domofon-amd64:latest   -t wlad1164/domofon-amd64:$VERSION   -f Dockerfile.amd64   .
docker buildx build --progress=plain --pull --push -t wlad1164/domofon-armv7:latest   -t wlad1164/domofon-armv7:$VERSION   -f Dockerfile.armv7   .
docker buildx build --progress=plain --pull --push -t wlad1164/domofon-aarch64:latest -t wlad1164/domofon-aarch64:$VERSION -f Dockerfile.aarch64 .
docker buildx build --progress=plain --pull --push -t wlad1164/domofon-i386:latest    -t wlad1164/domofon-i386:$VERSION    -f Dockerfile.i386    .
