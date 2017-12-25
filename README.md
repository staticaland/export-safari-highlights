# export-safari-highlights

A script to download highlights from Safari Books Online with totally uneccessary features and imports.

Trying out some `pipenv`, `pex` and `flit`.

To develop:

```
pipenv install
```

To make a PEX:

```
make pex
```

Why a silly `Makefile`?

> Automate to save mental energy, not time

> The same considerations apply to learning third party software. I suspect the time I’ve put into learning some features of Emacs, for example, will not pay for itself in terms of time invested versus time saved. But I’ve invested leisure time to save time when I’m working hard, not to save keystrokes but to save mental energy for the project at hand.

- [John Cook](https://www.johndcook.com/blog/2015/12/22/automate-to-save-mental-energy-not-time/)

✨

# Build

A Python `wheel` is a zip file. The code in this repo is put inside the zip file along with some metadata text files. We need a package manager that knows what to do with this zip file: `pip`.

This project uses `flit` to generate the (wheel) zip file. Most other projects use `setuptools` through `pip` with a `setup.py` file. `pip` version 10 will support `pyproject.toml`.

This is the content of the wheel zip file of this project:

```
├── export_safari_highlights
│   ├── __init__.py
│   ├── __main__.py
│   └── core.py
└── export_safari_highlights-1.1.dist-info
    ├── LICENSE
    ├── METADATA
    ├── RECORD
    ├── WHEEL
    └── entry_points.txt
```

It is built like this:

```
flit build
```

# Small projects for learning and teaching

...
