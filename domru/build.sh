#!/bin/bash
set -ev

VERSION=`cat config.json | jq -r '.version'`

echo "Running build for $VERSION"

docker buildx build --progress=plain --pull --push -t chOng-m0rrino/domofon-amd64:latest   -t chOng-m0rrino/domofon-amd64:$VERSION   -f Dockerfile.amd64   .
docker buildx build --progress=plain --pull --push -t chOng-m0rrino/domofon-armv7:latest   -t chOng-m0rrino/domofon-armv7:$VERSION   -f Dockerfile.armv7   .
docker buildx build --progress=plain --pull --push -t chOng-m0rrino/domofon-aarch64:latest -t chOng-m0rrino/domofon-aarch64:$VERSION -f Dockerfile.aarch64 .
docker buildx build --progress=plain --pull --push -t chOng-m0rrino/domofon-i386:latest    -t chOng-m0rrino/domofon-i386:$VERSION    -f Dockerfile.i386    .
