#!/bin/bash
#
# Copyright (c) 2014 Davide Guerri <davide.guerri@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


vagrant destroy -f >/dev/null 2>&1
# Create all the VMs before starting the provisioning
vagrant up --no-provision
# As we used ansible.limit = 'all', we only need to provision one system
vagrant provision controller

# ansible-playbook --private-key=~/.vagrant.d/insecure_private_key -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory -s -u vagrant ansible/playbook.yml

