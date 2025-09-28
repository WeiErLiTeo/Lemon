#!/bin/bash
set -e

# Update and install dependencies
sudo apt-get update
sudo apt-get install -y git curl perl build-essential xz-utils

# Clone Theos
if [ ! -d "/opt/theos" ]; then
  sudo git clone --recursive https://github.com/theos/theos.git /opt/theos
  sudo chown -R vscode:vscode /opt/theos
fi

# Set THEOS environment variable for the user
echo 'export THEOS=/opt/theos' >> ~/.bashrc
export THEOS=/opt/theos

# Download and install the iOS 16.2 SDK
if [ ! -d "$THEOS/sdks" ]; then
    mkdir -p $THEOS/sdks
fi

if [ ! -d "$THEOS/sdks/iPhoneOS16.2.sdk" ]; then
    echo "Downloading and verifying iOS 16.2 SDK..."
    set -x
    wget https://sdks.akestic.com/iPhoneOS16.2.sdk.zip
    if ! file iPhoneOS16.2.sdk.zip | grep -q "Zip archive data"; then
        echo "Error: Downloaded file is not a valid zip archive."
        exit 1
    fi
    unzip -o iPhoneOS16.2.sdk.zip -d $THEOS/sdks/
    rm iPhoneOS16.2.sdk.zip
    set +x
    echo "SDK installed."
else
    echo "iOS 16.2 SDK already exists."
fi

echo "Theos setup complete. Please run 'source ~/.bashrc' or restart the terminal."