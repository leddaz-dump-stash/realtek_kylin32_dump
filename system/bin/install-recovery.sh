#!/system/bin/sh
if ! applypatch -c RAW:/dev/block/mmcblk0p0:4087808:392d52ad4ac32104d1dcb62dddfba86e786a31e3; then
  applypatch  RAW:/dev/block/mmcblk0p0:3375104:7a1fa7b018f8f9e5e77d198d6d843c0f1924835f RAW:/dev/block/mmcblk0p0 392d52ad4ac32104d1dcb62dddfba86e786a31e3 4087808 7a1fa7b018f8f9e5e77d198d6d843c0f1924835f:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
