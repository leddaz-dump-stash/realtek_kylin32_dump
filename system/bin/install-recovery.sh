#!/system/bin/sh
if ! applypatch -c RAW:/dev/block/mmcblk0p0:4087808:8375ecd66a8f3811b4a7f1730275b0ecc116a188; then
  applypatch  RAW:/dev/block/mmcblk0p0:3375104:88d899412c10882c783b8774a175e5da72164f12 RAW:/dev/block/mmcblk0p0 8375ecd66a8f3811b4a7f1730275b0ecc116a188 4087808 88d899412c10882c783b8774a175e5da72164f12:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
