#!/bin/bash
set -ex
cd "$(dirname "$0")"

BASE_IMAGE="3.13.1-debian-bookworm-0.0.1-20241231"
VERSION="20241231"

docker build . -t optimize_allocation:${VERSION} --build-arg IMAGE_VERSION=${VERSION} --build-arg BASE_IMAGE=${BASE_IMAGE} --build-arg IMAGE_NAME="python_base" --build-arg PYTHON_VERSION=${PYTHON_VERSION}
docker tag optimize_allocation:${VERSION} optimize_allocation:latest

docker login
docker tag optimize_allocation:${VERSION} koichiroiijima/optimize_allocation:${VERSION}
docker tag optimize_allocation:${VERSION} koichiroiijima/optimize_allocation:latest
docker push koichiroiijima/optimize_allocation:${VERSION}
docker push koichiroiijima/optimize_allocation:latest
