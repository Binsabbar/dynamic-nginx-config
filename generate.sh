#!/bin/bash

mkdir -p nginx-conf-files

ROOT_KEYS="backend-1 backend-2 common-backends"

# Simply iterates through the ROOT keys in nginx-datasource.yml
for i in $ROOT_KEYS; do
  confd -onetime -backend file -file nginx-datasource.yml -prefix $i -confdir ./ 
  # -config-file nginx.toml
  mv nginx.conf $i.conf
done

echo "#################"
echo "Nginx config are generated for $ROOT_KEYS"
