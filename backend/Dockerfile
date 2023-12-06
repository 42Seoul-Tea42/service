FROM	python:3.12

WORKDIR /usr/app/srcs

RUN     apt-get update \
        && apt-get -y upgrade \
        && apt-get -y install python3-pip \
        && pip install flask \
        && pip install uwsgi \
        && ln -s /usr/local/bin/uwsgi /usr/bin/uwsgi

CMD [ "uwsgi", "uwsgi.ini" ]
