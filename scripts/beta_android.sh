cd android
# ./gradlew clean
gem install bundler:2.5.3
bundle install
bundle exec fastlane install_plugins
bundle exec fastlane deploy_apk_to_firebase_android
cd ..