#!/bin/bash

FIRMWARE=$1
MOUNT_POINT="/mnt/$FIRMWARE"

if [ "$(id -u)" != "0" ]; then
   echo "❌ Please run as root (sudo)."
   exit 1
fi

umount "$MOUNT_POINT"
rmdir "$MOUNT_POINT"
echo "🧹 Unmounted $MOUNT_POINT"
