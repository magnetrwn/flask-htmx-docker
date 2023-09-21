FROM python:3.11-slim-bookworm

WORKDIR /flask-htmx

COPY requirements.txt .

RUN mkdir app
COPY app/* app/

RUN mkdir scripts
COPY scripts/* scripts/
RUN chmod +x scripts/*.sh

CMD ["scripts/at-docker-init.sh"]
