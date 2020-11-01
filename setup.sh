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
#kubectl apply -f srcs/nginx.yaml
docker build -t ftps srcs/ftps
#kubectl apply -f srcs/ftps.yaml
docker build -t mysql srcs/mysql
#kubectl apply -f srcs/mysql.yaml
docker build -t wordpress srcs/wordpress
#kubectl apply -f srcs/wordpress.yaml
docker build -t phpmyadmin srcs/phpmyadmin
#kubectl apply -f srcs/phpmyadmin.yaml
docker build -t influxdb srcs/influxdb
docker build -t grafana srcs/grafana

echo "Creating pods and services..."
kubectl apply -f srcs/
#kubectl apply -f srcs/configmap.yaml

# Setup metalLB secret
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

printf "\nMinikube IP: ${IP}\n\n"

# Enabling of proxy and openning of dashboard
(kubectl proxy &) &>/dev/null
(minikube dashboard &) &>/dev/null
