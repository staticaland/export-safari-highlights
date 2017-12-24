# Shell to use with Make
SHELL := /bin/bash

all: hi

hi:
	@echo "Hello!"

isort:
	@echo "Sorting imports!"
	isort *.py

pex:
	make clean
	flit build --format wheel
	pip download -r <(pipenv lock -r) --dest ./wheelhouse
	pex export_safari_highlights \
	--disable-cache \
	--no-index \
	--find-links ./wheelhouse \
	--find-links ./dist \
	--requirement <(pipenv lock -r | cut -d' ' -f1) \
	-e export_safari_highlights.core:main \
	--output export_safari_highlights.pex

clean:
	rm -rf wheelhouse
	rm -rf dist
