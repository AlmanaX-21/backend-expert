#!/bin/bash

# Build the Docker image
docker build . -t web-app

# Stop and remove the previous running container if one exists
docker stop $(docker ps -a -q --filter "ancestor=web-app") 2>/dev/null || true
docker rm $(docker ps -a -q --filter "ancestor=web-app") 2>/dev/null || true

# Start the new Docker container
docker run --detach -p 8000:3000 -t web-app