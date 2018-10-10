# arch

## Getting started
Set keyboard with (for example) `loadkeys de`.
Identify device with `lsblk`. We assume sda as the harddrive to install arch on.

## Install with LVM2 and LUKS on BIOS with GPT

### Make 3 Partitions with gdisk
- /dev/sda1 2M    ef002
- /dev/sda2 500M  8300
- /dev/sda3 42G   8300 <- 42 == 100% of the remaining disk

### Create and mount cryptsetup
```
cryptsetup --verbose --cipher aes-xts-plain64 --key-size 512 --hash sha512 --iter-time 5000 --use-random luksFormat /dev/sda3
cryptsetup luksOpen /dev/sda3 arch
```

### Configure LVM
``` 
pvcreate /dev/mapper/arch
vgcreate archvg /dev/mapper/arch
lvcreate --size 8G archvg --name swap
lvcreate -l +100%FREE archvg --name root
```

### Create filesystems
```
mkswap /dev/mapper/archvg-swap
mkfs.ext4 /dev/mapper/archvg-root
mkfs.ext4 /dev/sda2
```

### Mount and prepare
```
mount /dev/mapper/archvg-root /mnt/
mkdir /mnt/boot
mount /dev/sda2 /mnt/boot/
```

### Install arch-base
```
pacstrap /mnt base base-devel
genfstab -pU /mnt >> /mnt/etc/fstab
```

### Configure system
```
arch-chroot /mnt /bin/bash
ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
passwd
```

Add 'ext4' to MODULES
Add 'encrypt' and 'lvm2' to HOOKS before filesystems
```
pacman -S vim
vim/nano /etc/mkinitcpio.conf
mkinitcpio -p linux
```

### Grub
```
pacman -S grub
pacman -S efibootmgr
grub-install
```
In /etc/default/grub edit the line GRUB_CMDLINE_LINUX to GRUB_CMDLINE_LINUX="cryptdevice=/dev/sda3:luks:allow-discards"

```
grub-mkconfig -o /boot/grub/grub.cfg
```

### Reboot
```
exit
reboot
```

## Credits/Sources
https://gist.github.com/dust321/035a568e47e7e575aaa5529e2a5973bd
