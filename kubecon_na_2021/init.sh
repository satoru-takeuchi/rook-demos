#!/bin/bash

export KUBECONFIG=$HOME/admin.conf

kubectl apply -f local.yaml

for f in crds.yaml common.yaml ; do
	kubectl apply -f $f
done
