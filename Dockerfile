FROM docker.io/nodisbr/python

RUN apt-get update
RUN apt-get -y install curl

RUN pip install setuptools wheel twine

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]