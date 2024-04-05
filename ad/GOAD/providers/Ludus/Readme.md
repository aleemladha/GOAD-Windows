# Deployment of GOAD using LUDUS

```
ludus range config set -f config.yml

ludus range deploy

# Wait for the range to successfully deploy
# You can watch the logs with `ludus range logs -f`
# Or check the status with `ludus range status`
```

### Once the lab Update the SRV02 machine , this is required for the iis module

```
ludus testing update -n JD-GOAD-SRV02 # replace "JD" with your range ID
ludus range logs -f
# Wait for all updates to be installed. 
# Be patient, this will take a long time.
# This required for the IIS install to work during GOAD setup.

# When you see the following, the updates are complete:
localhost                  : ok=5    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
JD-GOAD-SRV02              : ok=8    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 
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
