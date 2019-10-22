#!/usr/bin/env bash
set -e

GIT_DIR=/tmp/bucket-antivirus-function
LAST_WORKING_COMMIT=90b1061
AMZ_LINUX_VERSION=2

rm -rf $GIT_DIR

git clone https://github.com/upsidetravel/bucket-antivirus-function.git $GIT_DIR

cd $GIT_DIR
git checkout $LAST_WORKING_COMMIT

container_dir=/opt/app

rm -rf bin/
rm -rf build/

docker run --rm -i \
  -v $(pwd):$container_dir \
  -w=$container_dir \
  amazonlinux:$AMZ_LINUX_VERSION \
  /bin/bash -c "./build_lambda.sh"

# restore current user permissions
docker run --rm -i \
  -v $(pwd):$container_dir \
  -w=$container_dir \
  amazonlinux:$AMZ_LINUX_VERSION \
  /bin/bash -c "chown -R $(id -u ${USER}):$(id -g ${USER}) ."
