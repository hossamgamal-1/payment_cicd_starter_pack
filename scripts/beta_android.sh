cd android
# ./gradlew clean
bundle install
bundle exec fastlane install_plugins
bundle exec fastlane deploy_apk_to_firebase_android
cd ..