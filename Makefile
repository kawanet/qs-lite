#!/usr/bin/env bash -c make

SRC=./qs-lite.js
DEST=./dist/qs-lite.min.js
JSHINT=./node_modules/.bin/jshint
TERSER=./node_modules/.bin/terser
MOCHA=./node_modules/.bin/mocha
JSDOC=./node_modules/.bin/jsdoc

DOCS_DIR=./gh-pages
DOC_HTML=./gh-pages/module-qs-lite.html
DOCS_CSS_SRC=./assets/jsdoc.css
DOCS_CSS_DEST=./gh-pages/styles/jsdoc-default.css

all: $(DEST) jsdoc

clean:
	rm -fr $(DEST)

$(DEST): $(SRC)
	$(TERSER) $(SRC) -c -m -o $(DEST) --comments false

test: jshint $(DEST)
	$(MOCHA) -R spec test/*.js

jshint:
	$(JSHINT) $(SRC) ./*.json

jsdoc: $(DOC_HTML)

$(DOC_HTML): README.md $(SRC) $(DOCS_CSS_SRC) Makefile
	mkdir -p $(DOCS_DIR)
	$(JSDOC) -d $(DOCS_DIR) -R README.md $(SRC)
	cat $(DOCS_CSS_SRC) >> $(DOCS_CSS_DEST)
	rm -f $(DOCS_DIR)/*.js.html
	for f in $(DOCS_DIR)/*.html; do sed 's#</a> on .* 202.* GMT.*##' < $$f > $$f~ && mv $$f~ $$f; done
	for f in $(DOCS_DIR)/*.html; do sed 's#<a href=".*.js.html">.*line.*line.*</a>##' < $$f > $$f~ && mv $$f~ $$f; done

.PHONY: all clean test jshint jsdoc