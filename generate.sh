#!/bin/bash

# TODO: input file.md as an argument

usage() {
    cat <<EOM
    Builds the CV from markdown to PDF and static HTML
	Requires some tools to be installed, see prerequisites.sh
	Uses environment variables instead of arguments
		MD_FILE: Source markdown file. Default: DBS_CV_remote.md
		PDF_FILE: Output PDF file. Default DBS_CV_remote.pdf
		HTML_FILE: Output HTML file. Default index.html
		CSS_FILE: Style file. Default responsive.css 
	Usage: $0
EOM
    exit 0
}

init() {
	[[ -z "$MD_FILE" ]] && MD_FILE="DBS_CV_remote.md"
	[[ -z "$PDF_FILE" ]] && PDF_FILE="DBS_CV_remote.pdf"
	[[ -z "$HTML_FILE" ]] && HTML_FILE="index.html"
	[[ -z "$CSS_FILE" ]] && CSS_FILE="responsive.css"
	browser=$(xdg-settings get default-web-browser | cut -d "." -f1)
}

generate() {
	pandoc --standalone --from markdown --to html -c $CSS_FILE -o $HTML_FILE $MD_FILE
	wkhtmltopdf -L 20mm -R 20mm $HTML_FILE $PDF_FILE	
}

review() {
	$browser $PDF_FILE
	$browser $HTML_FILE
}

# Main program

while getopts "h" flag; do
    case "${flag}" in
        h)
			usage
			;;
    esac
done

init
generate
review
