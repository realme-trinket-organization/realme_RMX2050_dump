#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:cd01e229e29fb0ef61af03e9c74e33d1daa32180; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:6f04e3a5c0dc2a024d06a16e85fd0b620823f953 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:cd01e229e29fb0ef61af03e9c74e33d1daa32180 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
