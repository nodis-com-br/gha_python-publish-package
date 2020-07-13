#!/usr/bin/env bash

python3 setup.py sdist
python3 -m twine --repository-url https://${NODIS_PYPI_HOST}/simple -u ${NODIS_PYPI_USER} -p ${NODIS_PYPI_PASSWORD} upload dist/*