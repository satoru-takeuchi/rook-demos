#!/bin/bash

export KUBECONFIG=$HOME/admin.conf
export KUBE_VERSION=v1.20.5

kubectl delete -f sample-cluster.yaml

for i in operator common crds ; do
  kubectl delete -f ${i}.yaml
done

kubectl delete -f local-pvs.yaml

tests/scripts/kubeadm.sh clean

sudo rm -rf /var/lib/rook

for DISK in /dev/sdb /dev/sdc ; do
  sudo sgdisk --zap-all ${DISK}
  sudo dd if=/dev/zero of=${DISK} bs=1M count=100 oflag=dsync,direct
  sudo blkdiscard ${DISK}
done

ls /dev/mapper/ceph-* | xargs -I% -- dmsetup remove %

sudo rm -rf /dev/mapper/ceph-*
