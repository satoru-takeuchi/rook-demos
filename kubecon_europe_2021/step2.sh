#!/bin/bash

export KUBECONFIG=~/admin.conf

kubectl -n rook-ceph patch CephCluster rook-ceph --type=json -p '[{"op": "replace", "path": "/spec/storage/storageClassDeviceSets/0/count", "value":2}]'
