SRC_FILES=$(shell find src -type file -name '*.elm') $(shell find src -type file -name '*.js')

dist/app.js: $(SRC_FILES)
	elm make src/Main.elm --output $@

watch:
	echo $(SRC_FILES)
	nodemon --exec "make dist/app.js || exit 0" --ext elm --quiet

.PHONY: watch
