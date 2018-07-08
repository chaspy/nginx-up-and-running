#!/bin/bash
terraform apply -auto-approve
nginx_ip=$(terraform output | awk '{print $3}')
echo "[web]\n${nginx_ip}" > hosts
ansible-playbook -i hosts site.yml
