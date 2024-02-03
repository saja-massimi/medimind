// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC58tsBwnxrysmmzAZCmX_pvSGbhJhWjyU',
    appId: '1:1044473479741:web:6cbc33b38bf28c523ae054',
    messagingSenderId: '1044473479741',
    projectId: 'medimind-707fa',
    authDomain: 'medimind-707fa.firebaseapp.com',
    storageBucket: 'medimind-707fa.appspot.com',
    measurementId: 'G-RZDRHRB4EK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRD104mNRsLtnmzLnR710cBJ8UXyacobs',
    appId: '1:1044473479741:android:2cf4557c7cd10ccf3ae054',
    messagingSenderId: '1044473479741',
    projectId: 'medimind-707fa',
    storageBucket: 'medimind-707fa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZTreVYDmFRNvTG1u0mNwE3TKsrZ9xRzg',
    appId: '1:1044473479741:ios:f7fd54aea9756cb73ae054',
    messagingSenderId: '1044473479741',
    projectId: 'medimind-707fa',
    storageBucket: 'medimind-707fa.appspot.com',
    iosBundleId: 'com.example.mediMind',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZTreVYDmFRNvTG1u0mNwE3TKsrZ9xRzg',
    appId: '1:1044473479741:ios:b9d6160711b2a5963ae054',
    messagingSenderId: '1044473479741',
    projectId: 'medimind-707fa',
    storageBucket: 'medimind-707fa.appspot.com',
    iosBundleId: 'com.example.mediMind.RunnerTests',
  );
}