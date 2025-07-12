QEMU Firmware Automation Scripts

Included:
- run.sh                : Launch QEMU emulation with given firmware
- tmux-qemu-wrapper.sh : Start QEMU in tmux with auto-restart and logging
- mount-rootfs.sh      : Mount firmware ext4 image for static analysis
- unmount-rootfs.sh    : Cleanly unmount the firmware

Usage:
    chmod +x *.sh
    ./tmux-qemu-wrapper.sh ac6
    sudo ./mount-rootfs.sh ac6
