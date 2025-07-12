#!/bin/bash

FIRMWARE=$1
ROOTFS_IMG="./firmware/$FIRMWARE/rootfs/ext4.img"
MOUNT_POINT="/mnt/$FIRMWARE"

if [ "$(id -u)" != "0" ]; then
   echo "❌ Please run as root (sudo)."
   exit 1
fi

mkdir -p "$MOUNT_POINT"
mount -o loop "$ROOTFS_IMG" "$MOUNT_POINT"

echo "✅ Mounted at $MOUNT_POINT"
echo "To chroot: sudo chroot $MOUNT_POINT"
