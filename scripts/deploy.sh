#!/bin/bash

# Build the Docker image
docker build . -t web-app

# Stop and remove the previous running container if one exists
docker stop web-app-container 2>/dev/null || true
docker rm web-app-container 2>/dev/null || true

# Start the new Docker container
docker run --detach --name web-app-container -p 8000:3000 -t web-app
