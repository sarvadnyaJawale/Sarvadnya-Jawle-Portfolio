#!/bin/bash

CLUSTER="cluster-config.yaml"
DEPLOYMENT_FILE="deployment.yaml"
SERVICE_FILE="service.yaml"
INGRESS_FILE="ingress_with_tls.yaml"
TLS_ISSUER_FILE="tls_cert_issuer.yaml"

echo "Creating a single node cluster"
eksctl create cluster -f $CLUSTER

echo "Applying deployment.yaml..."
kubectl apply -f $DEPLOYMENT_FILE --validate=false

echo "Applying service.yaml..."
kubectl apply -f $SERVICE_FILE --validate=false

echo "Applying tls_cert_issuer.yaml..."
kubectl apply -f $TLS_ISSUER_FILE --validate=false

echo "Applying ingress_with_tls.yaml..."
kubectl apply -f $INGRESS_FILE --validate=false

echo "Installing NGINX Ingress Controller..."
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.11.2/deploy/static/provider/cloud/deploy.yaml

echo "Installing Cert-Manager..."
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.15.3/cert-manager.yaml

echo "Waiting for NGINX Ingress Controller and Cert-Manager to be ready..."
kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/name=ingress-nginx --timeout=120s
kubectl wait --namespace cert-manager --for=condition=ready pod --selector=app.kubernetes.io/name=cert-manager --timeout=120s

echo "Resources applied successfully."