#!/bin/bash
kind delete cluster --name spark-cluster
kind create cluster --config kind-config.yaml --name spark-cluster
kind load -n spark-cluster docker-image jfriasl-spark-base
read -p  "Pulsa [Enter] para empezar..."
kubectl apply -f spark-master-service.yaml 
#kubectl apply -f spark-worker-service.yaml 
kubectl apply -f spark-master-deployment.yaml 
kubectl apply -f spark-worker-deployment.yaml 
read -p  "Pulsa [Enter] para ver los pods..."
kubectl get pods
kubectl port-forward service/spark-master 8080:8080 7077:7077 8888:8888 29500:29500 





