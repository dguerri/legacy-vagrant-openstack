#!/bin/bash

. ./openstack-demo-example.rc

TENANT_NETWORK_GATEWAY=10.29.29.1
TENANT_NETWORK_CIDR=10.29.29.0/24

neutron net-create demo-net

neutron subnet-create demo-net --name demo-subnet \
  --gateway $TENANT_NETWORK_GATEWAY $TENANT_NETWORK_CIDR

neutron router-create demo-router

neutron router-interface-add demo-router demo-subnet

neutron router-gateway-set demo-router ext-net
