#!/system/bin/sh
if ! applypatch -c RAW:/dev/block/mmcblk0p0:4087808:a28bc35ecf5370225d595cec3f898a450c4efce5; then
  applypatch  RAW:/dev/block/mmcblk0p0:3375104:e7fb196344ca4b28e6c0cc30fb09021efd622a04 RAW:/dev/block/mmcblk0p0 a28bc35ecf5370225d595cec3f898a450c4efce5 4087808 e7fb196344ca4b28e6c0cc30fb09021efd622a04:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
