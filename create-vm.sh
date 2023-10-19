#!/bin/bash

vmname=$1
cpus=${2:-4}
mem=${3:-2048}
image=${4:-jammy-server-cloudimg-amd64}

echo "instance-id: $(uuidgen)" > meta-data
echo "local-hostname: ${vmname}" >> meta-data
cloud-localds seed-${vmname}.iso user-data meta-data

VBoxManage import ${image}.ova --vsys 0 --vmname ${vmname} --cpus ${cpus} --memory ${mem} --unit 9 --ignore
VBoxManage storageattach ${vmname} --storagectl IDE --port 0 --device 0 --type dvddrive --medium seed-${vmname}.iso
VBoxManage modifyvm ${vmname} --nic1 intnet --intnet1 intnet --nictype1 virtio --nic-promisc1 allow-vms
