FROM docker.io/nodisbr/python:3.7.3-0001

RUN pip install setuptools wheel twine

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]