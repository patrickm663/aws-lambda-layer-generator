#! /bin/bash

## 1. Create the Docker image containing the Python packages based off the Dockerfile
docker build -t python-3-8-docker .

## 2. Run the docker container as a background process
docker create python-3-8-docker

## 3. Get the name of the Docker container
NAME=$(docker ps -l -q)

## 4. Copy the zipped package from the Docker container into output-layer/ 
docker cp $NAME:python-layer3-8.zip output-layer/

## 5. Delete the image and clean up
docker image rm -f python-3-8-docker
