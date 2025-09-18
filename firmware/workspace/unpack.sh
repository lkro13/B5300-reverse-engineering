#!/usr/bin/env bash
set -e

if [ -z "$2" ]
then
    echo "Usage: ./unpack.sh [firmware.bin] [destination_directory]"
    exit 1
fi

echo "Removing old files"
rm -Rf "$2/gpt.img" "$2/1.img" "$2/minfs.img" "$2/fat.img" "$2/minfs"

echo "Creating $2 directory"
mkdir -p $2

echo "Extracting GPT image to $2/gpt.img"
dd if="$1" of="$2/gpt.img" bs=1024 skip=48 status=progress

#hey uhm i don't really know linux so you have to change this to the loop device or unmount all loop device first
loopdisk="loop0"
DISKNAME="/dev/${loopdisk}"
mapper="/dev/mapper/${loopdisk}"
sudo kpartx -av "$2/gpt.img"
echo "Attached GPT image to $DISKNAME"

echo "Extracting volume 1 to $2/1.img"
sudo dd if="${mapper}p1" of="$2/1.img" status=progress

echo "Extracting MINFS volume to $2/minfs.img"
sudo dd if="${mapper}p2" of="$2/minfs.img" status=progress

echo "Extracting FAT volume to $2/fat.img"
sudo dd if="${mapper}p3" of="$2/fat.img" status=progress

echo "Detaching $DISKNAME"
sudo kpartx -dv ${DISKNAME}
sudo losetup -d ${DISKNAME}

echo "Unpacking MINFS to $2/minfs"
mkdir -p "$2/minfs"
../bin/minfs dump "$2/minfs.img" "$2/minfs"
