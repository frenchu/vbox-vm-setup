# VirtualBox VM console provisioner

This is rather stupid bash script that creates VirtualBox virtual machine. It imports VM to VirtualBox from OVA image.
It assumes that image file is in current dir.

In addition it generates and mounts cloud-init image as dvd drive in the newly created VM for its initial setup.
You probably want to adjust user-data config file to your needs beforehand.

VM uses internal network for VM-to-VM communication.

## Usage

```shell
./create-vm.sh vm-name [cpus] [memory] [image-file]
```

`vm-name` parameter is mandatory. Other parameters has to be provided if the preceding one is present.

### WLS2

In Windows Linux Subsystem one can create a symlink to the `VBoxManage.exe` executable, e.g.:

```shell
cd ~/bin
ln -s /mnt/c/Program\ Files/Oracle/VirtualBox/VBoxManage.exe VBoxManage
```

## More info

For detailed description of the script commands check [the blog post](https://pawelweselak.com/posts/vbox-networking/) on [pawelweselak.com](https://pawelweselak.com).
