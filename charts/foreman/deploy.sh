#! /bin/sh

k="kubectl"
set -e
export RAILS_SECRET=`uuidgen`

$k create namespace foreman

$k config set-context $(kubectl config current-context) --namespace=foreman

$k create secret generic secret-key-base --from-literal=secret-key-base=${RAILS_SECRET}

$k create -f services/rails_svc.yaml
$k create -f jobs/setup.yaml
$k create -f deployments/rails_deploy.yaml
$k create -f deployments/worker_deploy.yaml
$k create -f ingresses/ingress.yaml
$k create -f web-autoscaler.yml
