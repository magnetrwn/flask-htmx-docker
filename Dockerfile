FROM python:3.11-slim-bookworm

WORKDIR /flask-htmx

COPY app \
    scripts \
    requirements.txt \
    .

RUN chmod +x scripts/at-docker-init.sh
RUN chmod +x scripts/run-app-gunicorn.sh
RUN chmod +x scripts/setup-python-env.sh

EXPOSE 8080

CMD ["scripts/at-docker-init.sh"]
