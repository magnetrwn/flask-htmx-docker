FROM python:3.11-slim-bookworm

WORKDIR /flask-htmx

COPY app \
    scripts \
    requirements.txt \
    .

RUN chmod +x scripts/*.sh

EXPOSE 8080

CMD ["scripts/at-docker-init.sh"]
