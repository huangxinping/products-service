#! /bin/bash
set -e

DOCKER_REGISTRY_USER_NAME = "huangxinping"
APP_NAME = "products-service"
APP_VERSION = "latest"

FULL_TAG = $DOCKER_REGISTRY_USER_NAME/$APP_NAME:$APP_VERSION

echo "Pulling Docker image from Registry"
docker pull $FULL_TAG

docker "Launching Docker Container"
do
