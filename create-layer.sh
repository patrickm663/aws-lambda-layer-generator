#! /bin/bash

# Author: Patrick Moehrke
# License: MIT License

echo "Python AWS Layer Generator"
echo " "
echo "1 - Python 3.8"
echo "2 - Python 3.9"
echo "3 - Python 3.10"
echo "4 - Python 3.11"
echo "5 - Python 3.12"
echo "Select a Python version: "

read version;

case $version in
  1) 
    PYTHON_VERSION="8"
    ;;
  2) 
    PYTHON_VERSION="9"
    ;;
  3)
    PYTHON_VERSION="10"
    ;;
  4)
    PYTHON_VERSION="11"
    ;;
  5)
    PYTHON_VERSION="12"
    ;;
  *)
    echo "Invalid option $version"
    echo "Exiting"
    exit 1
    ;;
esac


## 0. Update the Dockerfile master version based on the user choice
sed "s/3\.7/3\.$PYTHON_VERSION/" Dockerfile_master > Dockerfile_temp_
sed "s/3\-7/3\-$PYTHON_VERSION/" Dockerfile_temp_ > Dockerfile_temp
rm Dockerfile_temp_

## 1. Create the Docker image containing the Python packages based off the Dockerfile
echo "Building Docker image for Python 3.$PYTHON_VERSION"
docker build -t python-3-docker -f Dockerfile_temp .

## 2. Run the docker container as a background process
echo "Running container in background..."
docker create python-3-docker

## 3. Get the name of the Docker container
NAME=$(docker ps -l -q)

## 4. Copy the zipped package from the Docker container into output-layer/ 
echo "Copying the zip file from the container into output-layer/..."
docker cp $NAME:python-layer3-$PYTHON_VERSION.zip output-layer/

## 5. Delete the image and clean up
echo "Deleting image and cleaning up..."
docker image rm -f python-3-docker
rm Dockerfile_temp
