#!/usr/bin/env bash
set -e

if [ -z "$3" ]
then
    echo "Usage: ./repack.sh [original.bin] [output.bin] [source_directory]"
    exit 1
fi

../bin/minfs make $3/minfs minfs.img $3/minfs/rootfs_ini.tmp
cp "$1" "$2"

loopdisk="loop0"
DISKNAME="/dev/${loopdisk}"
mapper="/dev/mapper/${loopdisk}"
sudo kpartx -av "$3/gpt.img"
echo "Attached GPT image to $DISKNAME"

echo "Embedding MINFS volume to gpt.img"
sudo dd if="minfs.img" of="${mapper}p2" status=progress

echo "Removing temporary minfs.img"
rm minfs.img

echo "Detaching $DISKNAME"
sudo kpartx -dv ${DISKNAME}
sudo losetup -d ${DISKNAME}

echo "Embedding GPT image to $2"
dd if="$3/gpt.img" of="$2" bs=1024 seek=48 status=progress conv=notrunc
