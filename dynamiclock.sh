#!/bin/bash
# 检测蓝牙设备是否断开.如果断开就锁屏

# 蓝牙设备名称和MAC地址
name="name of bluetooth device"
device="mac address of bluetooth device"

num_name=$(bluetoothctl info | grep "Name: $name" | wc -l)
num_device=$(bluetoothctl info | grep "Device $device" | wc -l)

# 检测是否已经锁定
lock_status=$(dbus-send --session --dest=org.freedesktop.ScreenSaver --type=method_call --print-reply /org/freedesktop/ScreenSaver org.freedesktop.ScreenSaver.GetActive | grep 'boolean true' |wc -l)

if [ $lock_status -eq 0 ]; then
  if [ $num_name -eq 0 ] && [ $num_device -eq 0 ]; then
  # qdbus org.kde.screensaver /ScreenSaver Lock
  # qdbus org.freedesktop.ScreenSaver /ScreenSaver Lock
  # dbus-launch qdbus org.freedesktop.ScreenSaver /ScreenSaver Lock

    # 这里应该会锁定所有的会话.
    loginctl lock-sessions
  fi
fi

