#!/bin/bash

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.12/config/manifests/metallb-native.yaml

sleep 15

kubectl create ns ingress-nginx

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx 

helm repo update

kubectl apply -f nginx_error.yaml

helm install ingress-nginx ingress-nginx/ingress-nginx -n ingress-nginx --values ingress-nginx.yaml

sleep 15

kubectl apply -f deployment.yaml -f service.yaml -f ingress.yaml

echo "172.16.16.240 backend.example.com" >> sudo /etc/hosts





