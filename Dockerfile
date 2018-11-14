FROM python:3.7-slim-stretch

RUN apt-get update && \
	apt-get install --no-install-recommends -y \
			git build-essential \
			libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
    		libsqlite3-dev libffi-dev libxml2-dev libxslt1-dev \
			libre2-dev pkg-config && \
    pip3 install --process-dependency-links --no-binary --upgrade git+https://github.com/ludios/grab-site && \
    apt-get purge -y \
			git build-essential \
			libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
    		libsqlite3-dev libffi-dev libxml2-dev libxslt1-dev \
			libre2-dev pkg-config && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

VOLUME /data
WORKDIR /data
EXPOSE 29000
CMD ["python", "/usr/local/bin/gs-server"]