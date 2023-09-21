FROM python:3.11-slim-bookworm
WORKDIR /flask-htmx
COPY app db gunicorn.sh setupenv.sh setupdocker.sh requirements.txt .
RUN chmod +x gunicorn.sh setupenv.sh setupdocker.sh
EXPOSE 8080
CMD ["./setupdocker.sh"]
