#!/bin/sh

echo "Starting minikube..."
minikube start --driver=virtualbox

echo "Enabling Minikube addons..."
minikube addons enable metallb
minikube addons enable dashboard
minikube addons enable metrics-server

IP=$(minikube ip)

# Use the docker daemon from minikube
eval $(minikube docker-env)

echo "Building of Alpine images..."
docker build -t nginx srcs/nginx
docker build -t ftps srcs/ftps
docker build -t mysql srcs/mysql
docker build -t wordpress srcs/wordpress
docker build -t phpmyadmin srcs/phpmyadmin
docker build -t influxdb srcs/influxdb
docker build -t grafana srcs/grafana

echo "Creating pods and services..."
kubectl apply -f srcs/

# Setup metalLB secret
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

printf "\nMinikube IP: ${IP}\n\n"

# Enabling of proxy and openning of dashboard
(kubectl proxy &) &>/dev/null
(minikube dashboard &) &>/dev/null
