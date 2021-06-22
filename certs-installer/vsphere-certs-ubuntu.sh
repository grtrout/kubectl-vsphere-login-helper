#!/usr/bin/env bash
# vsphere-certs-ubuntu.sh
# Author: Greg Trout (grtrout@gmail.com)

# Variables
VCENTER_URL="https://company.com"
CA_DIRECTORY_NAME="vcsa1"

# Download and unzip the files
wget ${VCENTER_URL}/certs/download.zip
unzip download.zip
cd certs/lin

# Rename files with proper extensions
for f in *.0; do mv -- "$f" "${f%.0}.crt"; done
for f in *.r0; do mv -- "$f" "${f%.r0}.crl"; done

# Copy the files to the CA directory
sudo mkdir /usr/local/share/ca-certificates/${CA_DIRECTORY_NAME}
sudo cp ./* /usr/local/share/ca-certificates/${CA_DIRECTORY_NAME}

# Update the CA store
sudo update-ca-certificates
