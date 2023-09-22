FROM python:3.11-slim-bookworm

WORKDIR /flask-htmx

COPY requirements.txt .

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
