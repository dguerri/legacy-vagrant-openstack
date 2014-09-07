#!/bin/bash

. ./openstack-admin-example.rc

mkdir /tmp/images
cd /tmp/images

wget http://cdn.download.cirros-cloud.net/0.3.2/cirros-0.3.2-x86_64-disk.img

glance image-create --name "cirros-0.3.2-x86_64" \
                    --file cirros-0.3.2-x86_64-disk.img \
                    --disk-format qcow2 \
                    --container-format bare \
                    --is-public True \
                    --progress

rm -r /tmp/images
