# rm -rf ios/Pods
# npx pod-install

cd ios
bundle install
fastlane install_plugins
cd ..