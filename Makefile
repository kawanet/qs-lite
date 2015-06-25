#!/usr/bin/env bash -c make

SRC=./qs-lite.js
DEST=./dist/qs-lite.min.js
JSHINT=./node_modules/.bin/jshint
UGLIFYJS=./node_modules/.bin/uglifyjs
MOCHA=./node_modules/.bin/mocha

all: $(DEST)

clean:
	rm -fr $(DEST)

$(DEST): $(SRC)
	$(UGLIFYJS) $(SRC) -c -m -o $(DEST)

test: jshint $(DEST)
	$(MOCHA) -R spec test/*.js

jshint:
	$(JSHINT) $(SRC)

.PHONY: all clean test jshint
