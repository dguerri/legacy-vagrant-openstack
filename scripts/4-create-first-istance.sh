#!/bin/bash -e

. ./openstack-demo-example.rc

mkdir keys

ssh-keygen -q -t rsa -N "" -f ./keys/openstack.key
nova keypair-add --pub-key ./keys/openstack.key.pub demo-key

echo "Keypair list"
nova keypair-list

echo "Flavor list"
nova flavor-list

echo "Image list"
nova image-list

echo "Network list"
neutron net-list

echo "Secgroup list"
nova secgroup-list

DEMO_NET_ID=$(neutron net-list | awk '/demo-net/ { print $2 }')

nova boot --flavor m1.tiny --image cirros-0.3.3-x86_64 \
  --nic net-id=$DEMO_NET_ID \
  --security-group default --key-name demo-key demo-instance1

sleep 3

nova get-vnc-console demo-instance1 novnc
