#!/bin/bash

DIR=$(dirname "$0")

if [ -n "$TERMUX_VERSION" ]; then
    . $(dirname "$0")/termux.sh
	Termux
fi
if [ "$(uname)" == "Linux" ]; then
	if [ -f /etc/os-release ]; then
		source /etc/os-release
		if [[ "$ID" == "debian" || "$ID" == "ubuntu" ]]; then
		    . $(dirname "$0")/ubuntu_debian.sh
			UbuntuDebian
			bash ./configure.sh
		else
			echo "Script para essa distribuição ausente."
		fi
	fi
fi
if [ "$(uname)" == "Darwin" ]; then
    echo "Estou executando no macOS (Mac)."
fi
if [ "$(uname -o)" == "Cygwin" ] || [ "$(uname -o)" == "Msys" ]; then
    echo "Estou executando no Windows (Cygwin ou Git Bash)."
fi