FROM	python:3.12-slim

WORKDIR /usr/app/srcs

RUN     apt-get update \
        && apt-get -y upgrade \
        && apt-get install -y build-essential \
        && apt-get install -y libpcre3-dev \
        && UWSGI_PROFILE_OVERRIDE=ssl=true UWSGI_SSLDIR=/etc/ssl \
        && pip install --upgrade pip \
        && pip install flask \
        && pip install flask-restx \
        && pip install flask_cors \
        # && pip install Flask-Uploads \
        && pip install uwsgi \
        #pytz: KST 시간대
        && pip install pytz \
        && pip install psycopg2-binary \
        && pip install bcrypt \
        && pip install PyJWT \
        && pip install flask-jwt-extended \
        && pip install flask-socketio\
        && ln -s /usr/local/bin/uwsgi /usr/bin/uwsgi

RUN     groupadd -r beTeam && useradd -r -g beTeam beMaster

# RUN     mkdir -p /usr/app/srcs/app

# 테스트용
ENV FLASK_ENV=development

# CMD ["uwsgi", "--socket", "127.0.0.1:8080", "--protocol=http", "-w", "app:app", "--uid", "beMaster"]
CMD ["uwsgi", "--socket", ":5000", "--protocol=http", "-w", "wsgi:application", "--http-timeout", "3600", "--py-autoreload", "1"]

# CMD ["uwsgi", "--socket", ":5000", "--protocol=http", "-w", "wsgi:application"]
# CMD [ "uwsgi", "--uid", "beMaster", "--gid", "beTeam", "uwsgi.ini" ]
