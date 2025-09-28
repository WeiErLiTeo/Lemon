# 设置目标平台和 SDK 版本，可以根据需要修改
TARGET := tweak:clang:latest:16.0
# 设置编译架构
ARCHS = arm64 arm64e
# 如果您的 Tweak 是注入 SpringBoard，可以取消下面这行的注释
# INSTALL_TARGET_PROCESSES = SpringBoard

# 包含 Theos 的通用 Makefile 规则，这是必须的第一步
include $(THEOS)/makefiles/common.mk

# TWEAK_NAME 是您插件的名称
TWEAK_NAME = Lemon

# 在这里列出您所有需要编译的源文件（.x .xm .m 文件）
# 如果有多个文件，用空格隔开
Lemon_FILES = Tweak.x

# 包含 Tweak 特定的 Makefile 规则，这是必须的最后一步
include $(THEOS_MAKE_PATH)/tweak.mk

# 打包完成后执行的清理工作 (可选)
after-install::
	install.exec "sbreload"
