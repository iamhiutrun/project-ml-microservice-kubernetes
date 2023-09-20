#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="lhieu/microprj3"
# Step 2
# Run the Docker Hub container with kubernetes
kubectl run microprj3 \
    --image=$dockerpath \
    --port=80 --labels "app=microprj3"

# Step 3:
# List kubernetes pods
kubectl get pods
# Step 4:
# Forward the container port to a host
kubectl port-forward project3 8000:80
