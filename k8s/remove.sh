#!/bin/bash

helm uninstall ingress-nginx -n ingress-nginx

kubectl delete ns ingress-nginx

kubectl delete ns metallb-system

kubectl delete -f deployment.yaml -f service.yaml -f ingress.yaml 