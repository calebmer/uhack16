SYNC_PORT=4096

dist/app.js: App.elm
	elm make $< --output $@

watch:
	nodemon --exec "make dist/app.js || exit 0" --ext elm --quiet

.PHONY: watch
