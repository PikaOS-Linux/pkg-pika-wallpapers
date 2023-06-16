#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
./gen-xml.sh
mkdir -p ./pika-wallpapers
cp -rvf ./* ./pika-wallpapers || echo
cd ./pika-wallpapers

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
