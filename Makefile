# 定义变量
TARGET = dynamiclock
CONFIG_DIR = /home/dynamiclock
PREFIX = /etc/systemd/system

# 默认目标
all:

# 安装目标
install: 
	mkdir -p $(CONFIG_DIR); \
	install -Dm755 $(TARGET).sh $(CONFIG_DIR)/$(TARGET).sh
	install -Dm644 $(TARGET).service $(PREFIX)/$(TARGET).service
	install -Dm644 $(TARGET).timer $(PREFIX)/$(TARGET).timer
	systemctl daemon-reload
	systemctl enable $(TARGET).timer
	systemctl start $(TARGET).timer

# 卸载目标
uninstall:
	rm -f $(PREFIX)/$(TARGET).service
	rm -f $(PREFIX)/$(TARGET).timer
	rm -rf $(CONFIG_DIR)
	systemctl disable $(TARGET).timer
	systemctl stop $(TARGET).timer
	systemctl daemon-reload


# 声明伪目标
.PHONY: all clean install uninstall
