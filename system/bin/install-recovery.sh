#!/system/bin/sh
if ! applypatch -c RAW:/dev/block/mmcblk0p0:4087808:cccaaf561568f3a2eed4b0511b01a2e2c38c3387; then
  applypatch  RAW:/dev/block/mmcblk0p0:3375104:74f657a54a0e6d4118386992be4c84fc9e274747 RAW:/dev/block/mmcblk0p0 cccaaf561568f3a2eed4b0511b01a2e2c38c3387 4087808 74f657a54a0e6d4118386992be4c84fc9e274747:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
