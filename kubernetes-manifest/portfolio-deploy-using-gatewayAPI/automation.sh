#!/bin/bash

# Apply Kubernetes manifest files
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f aws_gatewayclass.yaml
kubectl apply -f aws_gateway.yaml
kubectl apply -f http_route.yaml

# Notify completion
echo "All manifests applied successfully."

