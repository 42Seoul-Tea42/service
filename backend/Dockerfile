# Python 3.12-slim을 기반으로 하는 Docker 이미지
FROM	python:3.12-slim

# 작업 디렉토리 설정
WORKDIR /usr/app/

# 필수 패키지 및 의존성 설치
RUN     apt-get update \
        && apt-get -y upgrade \
        && apt-get install -y build-essential \
        && apt-get install -y libpcre3-dev \
        && pip install --upgrade pip 

# 가상 환경 생성
RUN     python -m venv /usr/app/venv

# 활성화된 가상 환경으로 변경
ENV     PATH="/usr/app/venv/bin:$PATH"

# 패키지 설치
COPY requirements.txt /usr/app/
RUN pip install -r requirements.txt

# 사용자 및 그룹 생성
RUN groupadd -r beTeam && useradd -r -g beTeam beMaster

# 컨테이너가 시작될 때 실행할 명령 지정
CMD ["gunicorn", "-k", "gevent", "-c", "./srcs/gunicorn.py", "wsgi:application"]