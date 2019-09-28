set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
GIT_DIR=$DIR/../.tmp/bucket-antivirus-function
AMZ_LINUX_VERSION=2

mkdir -p $GIT_DIR
git clone https://github.com/upsidetravel/bucket-antivirus-function.git $GIT_DIR

cd $GIT_DIR

container_dir=/opt/app

rm -rf bin/
rm -rf build/

docker run --rm -i \
  -v $(pwd):$container_dir \
  -w=$container_dir \
  amazonlinux:$AMZ_LINUX_VERSION \
  /bin/bash -c "./build_lambda.sh"
