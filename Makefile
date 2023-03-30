SHELL=/bin/bash

# Environment variables
out_path := out
out_html := index.html
out_pdf := DBS_CV_remote.pdf
in_file := DBS_CV_remote.md
in_path := src
utils_path := md2html/scripts
utils_scr := generate.sh
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

all:
	mkdir ${out_path}
	./${utils_path}/${utils_scr} ${IN_ARGS} ${CSS_ARGS} ${PDF_ARGS} ${HTML_ARGS}

clean:
	rm -r ${out_path}