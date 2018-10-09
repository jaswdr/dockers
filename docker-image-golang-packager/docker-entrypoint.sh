#!/bin/bash

if [ "$1" = "" ]; then
    echo 'Please pass the program name as parameter'
    exit 1
fi

export VERSION="$(git describe --tags).$(git describe --all | wc -l)"
if [ $VERSION = "" ]; then
    echo "Invalid version, found '$VERSION'"
    exit 1
fi

if [ -d build ]; then
    echo 'Cleaning build directory'
    rm -rf build
fi

set -xe

echo "Building $VERSION"

mkdir p build

###############
# Linux amd64 #
###############

mkdir -p build/linux_amd64
CC=gcc CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go build -o "./build/linux_amd64/$1"
sha256sum "./build/linux_amd64/$1" > "./build/linux_amd64/checksum.txt"
tar -C './build/linux_amd64/' -czvf "./build/$1_linux_amd64_$VERSION.tar.gz" $1 checksum.txt

export DEBTMP=$(mktemp -d /tmp/deb_build_XXXX)
mkdir -p "$DEBTMP/DEBIAN"
echo -e "Package: $1\nVersion: $VERSION\nArchitecture: amd64\nMaintainer: Nobody\nDescription: This package was build with https://github.com/jaswdr/docker-image-golang-packager" > "$DEBTMP/DEBIAN/control"
cat "$DEBTMP/DEBIAN/control"
mkdir -p "$DEBTMP/usr/local/bin"
cp "./build/linux_amd64/$1" "$DEBTMP/usr/local/bin/$1"
(cd $DEBTMP && dpkg-deb --build $PWD)
mv "$DEBTMP.deb" "./build/$1_linux_amd64_$VERSION.deb"

#############
# Linux ARM #
#############

mkdir -p build/linux_arm
CC=arm-linux-gnueabi-gcc CGO_ENABLED=1 GOOS=linux GOARCH=arm go build -o "./build/linux_arm/$1"
sha256sum "./build/linux_arm/$1" > "./build/linux_arm/checksum.txt"
tar -C './build/linux_arm/' -czvf "./build/$1_linux_arm_$VERSION.tar.gz" $1 checksum.txt

export DEBTMP=$(mktemp -d /tmp/deb_build_XXXX)
mkdir -p "$DEBTMP/DEBIAN"
echo -e "Package: $1\nVersion: $VERSION\nArchitecture: armhf\nMaintainer: Nobody\nDescription: This package was build with https://github.com/jaswdr/docker-image-golang-packager" > "$DEBTMP/DEBIAN/control"
cat "$DEBTMP/DEBIAN/control"
mkdir -p "$DEBTMP/usr/local/bin"
cp "./build/linux_arm/$1" "$DEBTMP/usr/local/bin/$1"
(cd $DEBTMP && dpkg-deb --build $PWD)
mv "$DEBTMP.deb" "./build/$1_linux_arm_$VERSION.deb"

###############
# Windows 386 #
###############

mkdir -p build/windows_386
CC=i686-w64-mingw32-gcc CGO_ENABLED=1 GOOS=windows GOARCH=386 go build -o "./build/windows_386/$1.exe"
sha256sum "./build/windows_386/$1.exe" > "./build/windows_386/checksum.txt"
zip -j "./build/$1_windows_386_$VERSION.zip" "./build/windows_386/$1.exe" "./build/windows_386/checksum.txt"
