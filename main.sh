#! /bin/bash

set -e

VERSION="1.3.0"

source ./pika-build-config.sh

echo "$PIKA_BUILD_ARCH" > pika-build-arch

# Clone Upstream
./gen-xml.sh
mkdir -p ./pika-wallpapers
cp -rvf ./* ./pika-wallpapers || true
cd ./pika-wallpapers

# Build package
LOGNAME=root dh_make --createorig -y -l -p pika-wallpapers_"$VERSION" || echo "dh-make: Ignoring Last Error"
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/