#!/bin/bash

# download .deb package to $1_{version}.deb
apt download $1
# extract .deb package to ./$1/
dpkg-deb -x $1*.deb $1/
# list all files extracted
find $1/
