#!/bin/bash --

venv=.venv3

if [[ ! -d "${venv}" ]]; then
  python3 -m venv "${venv}"
  source ${venv}/bin/activate
  pip3 install -U pip
  pip3 install pybtex
fi

source ${venv}/bin/activate
python extract_bibtex.py theses.bib ../_theses
python extract_bibtex.py pubs-reviewed.bib ../_pubs
