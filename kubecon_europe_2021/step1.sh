#!/bin/bash

export KUBECONFIG=~/admin.conf

kubectl apply -f sample-cluster.yaml
kubectl apply -f toolbox.yaml
