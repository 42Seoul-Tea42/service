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
        && pip install flask-socketio \
        && pip install geopy \
        && pip install requests \
        && ln -s /usr/local/bin/uwsgi /usr/bin/uwsgi

RUN     groupadd -r beTeam && useradd -r -g beTeam beMaster

CMD ["uwsgi", "--uid", "beMaster", "uwsgi.ini"]
