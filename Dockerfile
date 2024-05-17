FROM python:3.10.12-alpine
ENV PYTHONUNBUFFERED 1

RUN mkdir /app
WORKDIR /app

RUN apk add --no-cache mariadb-connector-c-dev
# RUN /usr/local/bin/python -m pip install --upgrade pip
RUN apk update && apk add python3 python3-dev mariadb-dev build-base && pip3 install mysqlclient && apk del python3-dev mariadb-dev build-base

COPY requirements.txt /app/requirements.txt
RUN pip3 install -r requirements.txt

COPY . /app/

# python3 -m pip install --upgrade pip