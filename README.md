# My flake called "EasyNix" for NixOS
This is EasyNix, my configuration for NixOS. Based on the beautiful work by [Tyler Kelley](https://gitlab.com/Zaney/zaneyos). Feel free to poke around. Maybe you find some things, you like or learn new things from it.

![image](https://github.com/JerrySM64/dotfiles/assets/42114389/4310d38c-564a-4a6b-b1d5-25c5e2aa890a)

## How do I use your configuration?
That's fairly simple! Here are the steps to reproduce it on your system:

### Get into a NixOS live system
This step is very simple. Grab a NixOS install ISO from the NixOS website. I recommend the GNOME one. After downloading make a bootable USB ready with the solution of your choice. Then boot from it.

### Partitioning your hard drive
You can use GParted to partition your hard drive. Make sure the partition scheme is GPT. Then create partitions like that:

```
1-512 MiB   fat32       
513-100%    xfs/ext4
```

After creating the partitions, make sure the flags for the fat32 partition are set to boot and esp.

When that's done, close GParted and open up a terminal.

### Mounting the partitions
Inside the terminal, enter the following commands: I will use sda as an example. You can check it by entering `lsblk` into the terminal.

```bash
sudo mount /dev/sda2 /mnt 
sudo mkdir /mnt/boot
sudo mount /dev/sda1 /mnt/boot
```

### Git clone this repo
Now enter the following commands to get my repo:

```bash
git clone https://github.com/JerrySM64/dotfiles
cd dotfiles
```

### Generate your hardware.nix 
By default, my repo comes with the hardware.nix for Green Demon. That one will not work for your system. That's why you have to generate your own. To do that, enter the following command:

```bash
nixos-generate-config --show-hardware-config --root /mnt > hardware.nix
```
### Set your options
Now go into the options.nix and set your preferences. You can use nano for that. In there you can make changes to the options to have it just the way you want. To go into it, enter this command:

```bash
nano options.nix
```
### Set your password
By default, this comes with my password as the user password. Because you don't know my password, you need to change it. To do that, enter the following commands:

```bash
mkpasswd -m sha-512 <YOUR-PASSWORD>
```
**Example:**
```bash
  mkpasswd -m sha-512 password
$6$YdPBODxytqUWXCYL$AHW1U9C6Qqkf6PZJI54jxFcPVm2sm/XWq3Z1qa94PFYz0FF.za9gl5WZL/z/g4nFLQ94SSEzMg5GMzMjJ6Vd7.
```
Now copy the output and open up the system.nix file in nano. Search for the "hashedPassword" line and replace the original string with the output you copied.

### Install the system
When you're done with all of your changes, you are ready to install the system. To do that, enter the following commands into your terminal:

```bash
NIX_CONFIG="experimental-features = nix-command flakes" 
sudo nixos-rebuild switch --flake .#<The-Hostname-You-Set-In-The-Options-File>
```
## In case of an issue/suggestion
If you experience any issues or have a suggestion, feel free to open up an Issue and let me know! Enjoy!

