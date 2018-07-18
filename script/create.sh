#!/bin/bash
terraform apply -auto-approve
nginx_ip=$(terraform output | awk '{print $3}')
echo "[web]\n${nginx_ip}" > hosts
echo "\$nginx_ip=\"${nginx_ip}"\" > spec/spec_hosts.rb

echo "---waiting for ssh port opened---"
while true
do
  nc -z -w 1 $nginx_ip 22
  if [ $? = 0 ]; then
    break
  else
    echo "---not open, retry---"
    sleep 3
  fi
done
ansible-playbook -i hosts aws.yml
bundle exec rspec
