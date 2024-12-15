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

CJS_TEST=./test/*.js
ESM_DEST=./qs-lite.mjs
ESM_TEST=./test/esm.test.mjs

all: $(DEST) jsdoc

clean:
	rm -fr $(DEST)

$(DEST): $(SRC)
	$(TERSER) $(SRC) -c -m -o $(DEST) --comments false

test: jshint $(DEST) $(ESM_TEST)
	$(MOCHA) -R spec $(CJS_TEST)
	$(MOCHA) -R spec $(ESM_TEST)

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

#### ES Module

$(ESM_DEST): $(SRC) Makefile
	mkdir -p $(dir $@)
	perl -pe 's#^(\s*)(\S?.*?exports)#$$1// $$2#; s#^(\s*)(function (parse|stringify))#$$1export $$2#' < $< > $@
	diff $< $@ || true

$(ESM_TEST): $(JS_TEST) $(ESM_DEST) Makefile
	mkdir -p $(dir $@)
	cat $(CJS_TEST) |\
	perl -pe 's#^(var Qs)#// $$1#; s:^#:// #:; s#^#import * as Qs from "../qs-lite.mjs";\nimport {createRequire} from "module";\nconst require = createRequire(import.meta.url);\n\n# if $$. == 1' > $@

####

.PHONY: all clean test jshint jsdoc