FROM python:3-alpine3.15

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

CMD gunicorn --bind 0.0.0.0:5000 app:app