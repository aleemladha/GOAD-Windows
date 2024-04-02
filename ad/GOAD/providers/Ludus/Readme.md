# Deployment of GOAD using LUDUS

export RANGENUMBER=$(ludus range list --json | jq '.rangeNumber')
# `sudo apt install jq` if you don't have jq

sed -i "s/RANGENUMBER/$RANGENUMBER/g" inventory.yml

export ANSIBLE_COMMAND="ansible-playbook -i ../../../../ad/GOAD/data/inventory -i ./inventory.yml"

export LAB="GOAD"

../../../../scripts/provisionning.sh
