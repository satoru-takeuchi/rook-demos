#!/bin/bash

export KUBECONFIG=~/admin.conf
export KUBE_VERSION=v1.20.5

tests/scripts/kubeadm.sh up

kubectl apply -f local-pvs.yaml

for i in common crds operator ; do
  kubectl apply -f ${i}.yaml
done
