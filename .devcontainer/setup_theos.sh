#!/bin/bash
set -e

# Update and install dependencies
sudo apt-get update
sudo apt-get install -y git curl perl build-essential xz-utils unzip

# Clone Theos
if [ ! -d "/opt/theos" ]; then
  sudo git clone --recursive https://github.com/theos/theos.git /opt/theos
  sudo chown -R vscode:vscode /opt/theos
fi

# Set THEOS environment variable for the user
echo 'export THEOS=/opt/theos' >> ~/.bashrc
export THEOS=/opt/theos

# Download and install the iOS 16.1 SDK
if [ ! -d "$THEOS/sdks" ]; then
    mkdir -p $THEOS/sdks
fi

if [ ! -d "$THEOS/sdks/iPhoneOS16.1.sdk" ]; then
    echo "Downloading iOS 16.1 SDK..."
    curl -LO https://github.com/xybp888/iOS-SDKs/releases/download/iOS-SDKs/iPhoneOS16.1.sdk.zip
    unzip iPhoneOS16.1.sdk.zip -d $THEOS/sdks/
    rm iPhoneOS16.1.sdk.zip
    echo "SDK installed."
else
    echo "iOS 16.1 SDK already exists."
fi

echo "Theos setup complete. Please run 'source ~/.bashrc' or restart the terminal."