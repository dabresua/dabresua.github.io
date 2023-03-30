SHELL=/bin/bash

# Environment variables
out_path := out
out_html := index.html
out_pdf := DBS_CV_remote.pdf
in_file := DBS_CV_remote.md
in_path := src
utils_path := md2html/scripts
utils_scr := generate.sh
utils_conf := pre-requisites.sh
css_path := .
css_file := responsive.css

# Internal variables
IN_FILE := ${in_path}/${in_file}
CSS_FILE := ${css_path}/${css_file}
PDF_FILE := ${out_path}/${out_pdf}
HTML_FILE := ${out_path}/${out_html}

IN_ARGS := -m ${IN_FILE}
CSS_ARGS := -c ${CSS_FILE}
PDF_ARGS := -p ${PDF_FILE}
HTML_ARGS := -o ${HTML_FILE}

all : build

build :
	mkdir -p ${out_path}
	./${utils_path}/${utils_scr} ${OPT_ARGS} ${IN_ARGS} ${CSS_ARGS} ${PDF_ARGS} ${HTML_ARGS}

clean :
	rm -r ${out_path}

config :
	git submodule update --init
	./${utils_path}/${utils_conf}

upload :
	cp ${PDF_FILE} ${out_pdf}
	cp ${HTML_FILE} ${out_html}
	git add ${out_pdf} ${out_html}
	git commit -m "Update CV"

sync :
	git push

revert :
	git reset HEAD~1
	git checkout ${out_html} ${out_pdf}

publish : build upload clean