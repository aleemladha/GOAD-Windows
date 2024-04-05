# Deployment of GOAD using LUDUS

```
ludus range config set -f config.yml

ludus range deploy

# Wait for the range to successfully deploy
# You can watch the logs with `ludus range logs -f`
# Or check the status with `ludus range status`
```

```
export RANGENUMBER=$(ludus range list --json | jq '.rangeNumber')
```
# `sudo apt install jq` if you don't have jq

```
sed -i "s/RANGENUMBER/$RANGENUMBER/g" inventory.yml
```
```
export ANSIBLE_COMMAND="ansible-playbook -i ../../../../ad/GOAD/data/inventory -i ./inventory.yml"
```
```
export LAB="GOAD"
```
```
../../../../scripts/provisionning.sh
```
