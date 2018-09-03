#!/bin/bash
brew update
brew install libimobiledevice
brew install ideviceinstaller
brew install ios-deploy
pod repo update
gem update cocoapods
git clone https://github.com/flutter/flutter.git $HOME/flutter
export PATH=$HOME/flutter/bin:$HOME/flutter/bin/cache/dart-sdk/bin:$PATH
flutter doctor
flutter packages get
flutter packages pub run build_runner build
