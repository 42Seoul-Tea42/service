FROM	python:3.12-slim

WORKDIR /usr/app/srcs

RUN     apt-get update \
        && apt-get -y upgrade \
        # && apt-get -y install python3-pip \
        && pip install --upgrade pip \
        && pip install flask \
        && pip install flask-restx \
        # && pip install uwsgi \
        && pip install psycopg2-binary
        # && ln -s /usr/local/bin/uwsgi /usr/bin/uwsgi

# 테스트용! 진짜는 아직 안나옴 (debug는 진짜 테스트용)
CMD ["python3", "-m", "flask", "run", "--debug", "--host=0.0.0.0"]


# CMD [ "uwsgi", "uwsgi.ini" ]
# CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]