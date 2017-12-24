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
	pip download -r <(pipenv lock -r) --dest ./wheelhouse
	pex . \
	--disable-cache \
	--no-index \
	--find-links ./wheelhouse \
	--requirement <(pipenv lock -r | cut -d' ' -f1) \
	--script safaricsv.py \
	--output safaricsv.pex

clean:
	rm -rf wheelhouse
	rm -rf dist
