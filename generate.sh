#!/bin/bash

pandoc --standalone --from markdown --to html -c style.css -o DBS_CV_remote.html DBS_CV_remote.md && wkhtmltopdf -L 20mm -R 20mm DBS_CV_remote.html DBS_CV_remote.pdf && firefox DBS_CV_remote.pdf && firefox DBS_CV_remote.html
