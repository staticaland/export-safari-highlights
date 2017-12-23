# Shell to use with Make
SHELL := /bin/bash

all: hi

hi:
	@echo "Hello!"

pex:
	make clean
	pip download -r <(pipenv lock -r) --dest ./wheelhouse
	pex . -r <(pipenv lock -r | cut -d' ' -f1) -f ./wheelhouse --no-index -c safaricsv.py -o safaricsv.pex

clean:
	rm -rf wheelhouse
