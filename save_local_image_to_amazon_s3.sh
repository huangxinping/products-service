#! /bin/bash

APP_NAME=$APP_NAME

BUILD_NUMBER=${BUILD_NUMBER:-dev}
VERSION=${MAJOR_VERSION}.$BUILD_NUMBER

S3_BUCKET = $S3_BUCKET

FULL_TAG = $APP_NAME:$VERSION
FILE_NAME = $APP_NAME-$VERSION

mkdir -p target

echo "Saving Docker image to local file..."
docker save -o target/$FILE_NAME.tar $FULL_TAG

echo "Compressing local Docker image..."
gzip --force target/$FILE_NAME.tar

echo "Uploading docker image to s3..."
aws s3 mv target/$FILE_NAME.tar.gz s3://$S3_BUCKET/$APP_NAME/$FILE_NAME.tar.gz
