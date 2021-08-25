#!/bin/bash

# TODO: input file.md as an argument

input="DBS_CV_remote.md"
pdf="DBS_CV_remote.pdf"
html="index.html"
css="responsive.css"
# index.html is necesary to work with github pages

pandoc --standalone --from markdown --to html -c $css -o $html $input && \
wkhtmltopdf -L 20mm -R 20mm $html $pdf && firefox $pdf && firefox $html
