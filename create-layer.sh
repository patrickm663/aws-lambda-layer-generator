#! /bin/bash

# Author: Patrick Moehrke
# License: MIT License

## 1. Create the Docker image containing the Python packages based off the Dockerfile
echo "Building Docker image..."
docker build -t python-3-8-docker .

## 2. Run the docker container as a background process
echo "Running container in background..."
docker create python-3-8-docker

## 3. Get the name of the Docker container
NAME=$(docker ps -l -q)

## 4. Copy the zipped package from the Docker container into output-layer/ 
echo "Copying the zip file from the container into output-layer/..."
docker cp $NAME:python-layer3-8.zip output-layer/

## 5. Delete the image and clean up
echo "Deleting image and cleaning up..."
docker image rm -f python-3-8-docker
