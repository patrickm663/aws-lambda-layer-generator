# This Dockerfile creates a zip file based off a requirements.txt file

## 1. Load Python 3.8-slim, a Debian image
FROM python:3.8-slim

## 2. Update packages and install zip
RUN apt update && apt upgrade -y
RUN apt install zip -y

## 3. Update pip
RUN pip install --upgrade pip

## 4. Create the package directory structure
RUN mkdir -p /python/lib/python3.8/site-packages/

## 5. Load and install the packages in requirements.txt
COPY src/requirements.txt requirements.txt
RUN pip install -r requirements.txt -t /python/lib/python3.8/site-packages/

## 6. Zip the installed Python libraries
RUN zip -r python-layer3-8.zip /python/*
CMD /bin/bash
