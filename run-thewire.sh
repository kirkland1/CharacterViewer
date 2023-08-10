flutter clean
flutter pub get
flutter pub global run rename --appname "The Wire Character Viewer" -t android
flutter pub global run rename --appname "The Wire Character Viewer" -t ios
flutter pub global run rename --bundleId com.sample.wireviewer -t android
flutter pub global run rename --bundleId com.sample.wireviewer -t ios
flutter run -t lib/MainDelegates/main_the_wire.dart
