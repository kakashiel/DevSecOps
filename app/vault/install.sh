#!/bin/sh
kubectl apply -f /ansible/files/namespace.yml
kubectl config set-context microk8s -ntools
kubectl create configmap vault --from-file=/app/vault/config.hcl -ntools
kubectl create -f /app/vault/vault-service.yml
kubectl apply -f /app/vault/vault-deployment.yml