FROM python:3.11-slim-bookworm

WORKDIR /flask-htmx

COPY app \
    db \
    run-app-gunicorn.sh \
    setup-python-env.sh \
    at-docker-init.sh \
    requirements.txt \
    .

RUN chmod +x \
    run-app-gunicorn.sh \
    setup-python-env.sh \
    at-docker-init.sh

EXPOSE 8080

CMD ["./at-docker-init.sh"]
