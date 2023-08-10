flutter clean
flutter pub get
flutter pub global run rename --appname "Simpsons Character Viewer" -t android
flutter pub global run rename --appname "Simpsons Character Viewer" -t ios
flutter pub global run rename --bundleId com.sample.simpsonsviewer -t android
flutter pub global run rename --bundleId com.sample.simpsonsviewer -t ios
flutter run -t lib/MainDelegates/main_simpsons.dart
