.PHONY: run
run: build
	tput reset
	@node cli/index.js

.PHONY: build
build:
	@echo "Building the CLI"
	@rm -rf build/elm.js elm-stuff cli/elm-stuff
	@cd cli && elm make Main.elm --output ../build/elm.js

.PHONY: test
test: end-to-end-test unit-test

.PHONY: unit-test
unit-test:
	@echo "Running unit tests"
	@rm -rf elm-stuff
	@elm make --output /dev/null # build the library just to test it compiles
	@elm-test

.PHONY: end-to-end-test
end-to-end-test: build
	@echo "Running end-to-end tests"
	@$(MAKE) -C end-to-end-tests clean run

.PHONY: format
format:
	elm-format . --yes


.PHONY: lint
lint:
	elm-format . --validate

.PHONY: readme_lib
readme_lib:
	mv README.md README-github.md
	mv README-library.md README.md

.PHONY: readme_gh
readme_gh:
	mv README.md README-library.md
	mv README-github.md README.md
