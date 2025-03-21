#!/bin/bash

# Variables
DOCKER_USERNAME="nicholina1"
BACKEND_IMAGE_NAME="clm-backend"
FRONTEND_IMAGE_NAME="clm-frontend"
IMAGE_TAG="latest"

docker build -t clm_backend:v1 -f ./back-end/Dockerfile ./back-end
docker build -t clm_frontend:v1 -f ./front-end/Dockerfile ./front-end
# # Build the Docker image
# docker build -t $DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG .

# # Log in to Docker Hub
# echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin

# # Push the Docker image to Docker Hub
# docker push $DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG

# # Log out from Docker Hub
# docker logout

