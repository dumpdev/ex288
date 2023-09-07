#!/bin/bash
oc login -u kubeadmin -p vUTyi-oRFXW-nRScM-67YMw  https://api.crc.testing:6443
oc policy add-role-to-user view developer -n openshift-image-registry

oc patch configs.imageregistry.operator.openshift.io/cluster --patch '{"spec":{"defaultRoute":true}}' --type=merge
oc new-project xerter

oc new-app --name repure --image=quay.io/redhattraining/hello-world-nginx

oc policy add-role-to-user view developer
