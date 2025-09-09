#!/bin/bash
kubectl delete deployment spark-master
kubectl delete deployment spark-worker
kubectl delete service spark-master
read -p  "Pulsa [Enter] para empezar..."
kubectl apply -f spark-master-service.yaml 
kubectl apply -f spark-master-deployment.yaml 
kubectl apply -f spark-worker-deployment.yaml 
read -p  "Pulsa [Enter] para ver los pods..."
kubectl get pods
