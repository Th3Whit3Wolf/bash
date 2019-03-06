#!/bin/bash

# Check Latest Atom Version Against the Currently Installed Version of Atom
ATOM_INSTALLED_VERSION=$(rpm -qi atom | grep "Version" |  cut -d ':' -f 2 | cut -d ' ' -f 2)
ATOM_LATEST_VERSION=$(curl -sL "https://api.github.com/repos/atom/atom/releases/latest" | grep -E "https.*atom-amd64.tar.gz" | cut -d '"' -f 4 | cut -d '/' -f 8 | sed 's/v//g')

# Check Latest Beta Version Atom Version Against the Currently Installed Version of Atom Beta
ATOMB_INSTALLED_VERSION=$(rpm -qi atom-beta | grep "Version" | cut -d ':' -f 2 | cut -d ' ' -f2)
ATOMB_LATEST_VERSION=$(lynx -dump -listonly "https://github.com/atom/atom/releases" | grep -E "https.*atom-amd64.tar.gz" | head -n 1 | cut -d '/' -f 8 | sed 's/v//g' | tr "-" ".")
ATOM_BETA_LATEST_GET_INSTALLED=$(lynx -dump -listonly https://github.com/atom/atom/releases | grep -E "https.*atom-amd64.tar.gz" | head -n 1 | cut -d '/' -f 8 | sed 's/v//g')

# If Atom update is availabe download and install; else let user know atom is up to date.
if [[ $ATOM_INSTALLED_VERSION < $ATOM_LATEST_VERSION ]]; then
  sudo dnf install -y https://github.com/atom/atom/releases/download/v${ATOM_LATEST_VERSION}/atom.x86_64.rpm
else
  echo "Atom is up to date!"
fi

# If Atom Beta update is availabe download and install; else let user know atom-beta is up to date.
if [[ $ATOMB_INSTALLED_VERSION < $ATOMB_LATEST_VERSION ]]; then
  sudo dnf install -y https://github.com/atom/atom/releases/download/v${ATOM_BETA_LATEST_GET_INSTALLED}/atom.x86_64.rpm
else
  echo "Atom Beta is up to date!"
fi
