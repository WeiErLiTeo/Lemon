TARGET = iphone:clang:latest:16.1
ARCHS = arm64 arm64e
INSTALL_TARGET_PROCESSES = Aweme

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DYYY

DYYY_FILES = DYYY.xm DYYYFloatClearButton.xm DYYYFloatSpeedButton.m DYYYSettings.xm DYYYABTestHook.xm DYYYLongPressPanel.xm DYYYSettingsHelper.m DYYYImagePickerDelegate.m DYYYBackupPickerDelegate.m DYYYSettingViewController.m DYYYBottomAlertView.m DYYYCustomInputView.m DYYYOptionsSelectionView.m DYYYIconOptionsDialogView.m DYYYAboutDialogView.m DYYYKeywordListView.m DYYYFilterSettingsView.m DYYYConfirmCloseView.m DYYYToast.m DYYYManager.m DYYYUtils.m CityManager.m
# 下面这行已经移除了对 libs/include 的依赖
DYYY_CFLAGS = -fobjc-arc -w
# 下面这行已经移除了对 libs 文件夹和 webp 库的依赖
DYYY_LDFLAGS = -weak_framework AVFAudio
DYYY_FRAMEWORKS = CoreAudio

include $(THEOS_MAKE_PATH)/tweak.mk
