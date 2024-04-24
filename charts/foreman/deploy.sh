#! /bin/sh

k="kubectl"
set -e
export DB_USER_PASS=`uuidgen`
export DB_USERNAME='postgres'
export DB_NAME='foreman'
export RAILS_SECRET=`uuidgen`

$k create namespace foreman

$k config set-context $(kubectl config current-context) --namespace=foreman

$k create secret generic db-user-pass --from-literal=password=${DB_USER_PASS}
$k create secret generic db-user --from-literal=username=${DB_USERNAME}
$k create secret generic db-url --from-literal=url=postgres://${DB_USERNAME}:${DB_USER_PASS}@postgres/${DB_NAME}?pool=5 
$k create secret generic secret-key-base --from-literal=secret-key-base=${RAILS_SECRET}

$k create -f volumes/postgres_volumes.yaml
$k create -f volumes/redis_volumes.yaml
$k create -f services/postgres_svc.yaml
$k create -f services/redis_svc.yaml
$k create -f services/rails_svc.yaml
$k create -f deployments/postgres_deploy.yaml
$k create -f deployments/redis_deploy.yaml
$k create -f jobs/setup.yaml
$k create -f deployments/rails_deploy.yaml
$k create -f deployments/worker_deploy.yaml
$k create -f ingresses/ingress.yaml
$k create -f web-autoscaler.yml
