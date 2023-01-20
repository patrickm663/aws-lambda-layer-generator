#! /bin/bash

# Author: Patrick Moehrke
# License: MIT License

echo "Select a Python version: "
echo "1 - Python 3.7"
echo "2 - Python 3.8"
echo "3 - Python 3.9"
read version;

case $version in
    1) 
        ## 1. Create the Docker image containing the Python packages based off the Dockerfile
        echo "Building Docker image for Python 3.7..."
        docker build -t python-3-7-docker -f Dockerfile3-7 .

        ## 2. Run the docker container as a background process
        echo "Running container in background..."
        docker create python-3-7-docker

        ## 3. Get the name of the Docker container
        NAME=$(docker ps -l -q)

        ## 4. Copy the zipped package from the Docker container into output-layer/ 
        echo "Copying the zip file from the container into output-layer/..."
        docker cp $NAME:python-layer3-7.zip output-layer/

        ## 5. Delete the image and clean up
        echo "Deleting image and cleaning up..."
        docker image rm -f python-3-7-docker
        ;;
    2) 
        ## 1. Create the Docker image containing the Python packages based off the Dockerfile
        echo "Building Docker image for Python 3.8..."
        docker build -t python-3-8-docker -f Dockerfile3-8 .

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
        ;;
    3) 
        ## 1. Create the Docker image containing the Python packages based off the Dockerfile
        echo "Building Docker image for Python 3.9..."
        docker build -t python-3-9-docker -f Dockerfile3-9 .

        ## 2. Run the docker container as a background process
        echo "Running container in background..."
        docker create python-3-9-docker

        ## 3. Get the name of the Docker container
        NAME=$(docker ps -l -q)

        ## 4. Copy the zipped package from the Docker container into output-layer/ 
        echo "Copying the zip file from the container into output-layer/..."
        docker cp $NAME:python-layer3-9.zip output-layer/

        ## 5. Delete the image and clean up
        echo "Deleting image and cleaning up..."
        docker image rm -f python-3-9-docker
        ;;
    *)
        echo "Invalid option $version";;
esac
