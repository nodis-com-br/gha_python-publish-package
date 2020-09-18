#!/usr/bin/env bash
set -e

BUILD_CMD="python3 setup.py sdist"
PUBLISH_CMD="python3 -m twine upload --repository-url https://${NODIS_PYPI_HOST}/simple -u ${NODIS_PYPI_USER} -p ${NODIS_PYPI_PASSWORD} dist/*"

if [[ -z ${NODIS_DEPLOY_ENV} ]]; then
    pip -i https://${NODIS_PYPI_USER}:${NODIS_PYPI_PASSWORD}@${NODIS_PYPI_HOST}/simple install pyalias
    curl -X DELETE "https://${NODIS_PYPI_USER}:${NODIS_PYPI_PASSWORD}@${NODIS_PYPI_HOST}/api/package/{${NODIS_PROJECT_NAME}/{${NODIS_PROJECT_NAME}-${NODIS_DEPLOY_ENV}.tar.gz" || true
    ${BUILD_CMD}
    pyalias --environment ${NODIS_DEPLOY_ENV} dist
    ${PUBLISH_CMD}
else
    ${BUILD_CMD}
    ${PUBLISH_CMD}
fi

