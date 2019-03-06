#!/bin/bash

if [ "$1" = "-a" ] || [ "$1" = "--arch" ]; then
	if [ "$1" != "" ]; then
		sudo pacman-key --recv-keys $2
		sudo pacman-key --finger $2
		sudo pacman-key --lsign-key $2
	else
		echo "Need a key"
	fi
elif [ "$1" = "-p" ] || [ "$1" = "--pgp" ]; then
	if [ "$1" != "" ]; then
		sudo gpg --recv-keys $2
		sudo gpg --lsign-key $2
	else
		echo "Need a key"
	fi
elif [ "$1" = "-b" ] || [ "$1" = "--both" ]; then
	if [ "$1" != "" ]; then
		sudo pacman-key --recv-keys $2
		sudo pacman-key --finger $2
		sudo pacman-key --lsign-key $2
		sudo gpg --recv-keys $2
		sudo gpg --lsign-key $2
	else
		echo "Need a key"
	fi
elif [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
	echo "sign [FLAG] KEY"
	echo "sign is a key signing utility"
	echo ""
	echo "-a, --arch              Pacman sign"
	echo "-b, --both              Pacman and PGP sign"
	echo "-h, --help              Prints help information"
	echo "-p, --pgp               PGP sign"

else
	echo "sign [FLAG] KEY"
	echo "sign is a key signing utility"
	echo ""
	echo "-a, --arch              Pacman sign"
	echo "-b, --both              Pacman and PGP sign"
	echo "-h, --help              Prints help information"
	echo "-p, --pgp               PGP sign"

fi
