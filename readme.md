# 模拟Windwos11的自动锁定脚本
## 当Linux连接的指定蓝牙设备断开时,自动锁定屏幕.本人用不惯其他桌面,所以只支持KDE
1. 确保系统已经开启了蓝牙功能
2. 确保系统KDE登录之后能够自动连接设备
3. 确保设备之前已经完成了配对,并加入了信任列表
4. 使用bluetoothctl命令查看设备的NAME和MAC地址

## 安装
make install

## 卸载
make uninstall