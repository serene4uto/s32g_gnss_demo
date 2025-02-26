#!/bin/bash

# Set the project root directory (where src and docker folders are located)
PROJECT_DIR=$(pwd)

# Set the Dockerfile location
DOCKERFILE_PATH="$PROJECT_DIR/docker/Dockerfile"

# Set the Docker build context (root of your project)
BUILD_CONTEXT="$PROJECT_DIR"

# Set the image name (you can change this to something relevant)
IMAGE_NAME="s32g-gnss-demo"

# Get source code
mkdir -p $PROJECT_DIR/src
vcs import $PROJECT_DIR/src < $PROJECT_DIR/s32g_gnss.repos --recursive

# Build the Docker image
echo "Building Docker image: $IMAGE_NAME"
docker build -f "$DOCKERFILE_PATH" -t "$IMAGE_NAME" "$BUILD_CONTEXT"

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Docker image built successfully!"
else
    echo "Docker build failed."
    exit 1
fi
