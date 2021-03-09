#! /bin/bash

# setup golang
git clone https://github.com/canha/golang-tools-install-script
cd golang-tools-install-script
chmod +x goinstall.sh
./goinstall.sh
cd ..
rm -rf golang-tools-install-script
