.PHONY: test upload clean bootstrap

pex:
	pip download -r <(pipenv lock -r) --dest ./wheelhouse
	pex . -r <(pipenv lock -r | cut -d' ' -f1) -f ./wheelhouse --no-index -c safaricsv.py -o safaricsv.pex

clean:
	rm -rf wheelhouse
