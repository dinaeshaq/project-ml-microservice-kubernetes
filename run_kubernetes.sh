#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="dinaeshaq/ml-dina"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run ml-dina\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=80 --labels app=ml-dina

# Step 3:
# List kubernetes pods
kubectl get pods
# Step 4:
# Forward the container port to a host
kubectl port-forward ml-dina 8000:80
# Log container outputs
kubectl logs --follow ml-dina


