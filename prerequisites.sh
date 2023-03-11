#!/bin/bash

usage() {
    cat <<EOM
    Check and install pre-requisites for building the CV from markdown
	Install the following packages: $packages
	Usage: $0
EOM
    exit 0
}

browser() {
	br=$(xdg-settings get default-web-browser | cut -d "." -f1)
	if [[ -z $br ]]; then
		echo "Must install some browser"
		exit 1
	else
		echo "Your default browser is $br"
	fi
}

requisites() {
	sudo apt-get install -y $packages
}

# Main program

packages="pandoc wkhtmltopdf"

while getopts "h" flag; do
    case "${flag}" in
        h)
			usage
			;;
    esac
done

browser
requisites
