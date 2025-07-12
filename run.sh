#!/bin/bash

FIRMWARE=$1
ROOTFS_DIR="./firmware/$FIRMWARE/rootfs"
KERNEL="./zImage-$FIRMWARE"
QEMU_BIN="qemu-system-arm"

$QEMU_BIN \
    -M versatilepb \
    -cpu cortex-a8 \
    -m 256M \
    -nographic \
    -kernel $KERNEL \
    -append "root=/dev/sda rw console=ttyAMA0" \
    -drive file=$ROOTFS_DIR/ext4.img,format=raw,if=none,id=hd0 \
    -device virtio-blk-device,drive=hd0 \
    -net nic -net user \
    -no-reboot
