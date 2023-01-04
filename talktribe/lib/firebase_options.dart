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
    apiKey: 'AIzaSyDX5jkNPay0YSfxfG-uSLp7_st8VWAwDdA',
    appId: '1:589568007478:web:d81e39eb269f67fa9fe797',
    messagingSenderId: '589568007478',
    projectId: 'flutter-final-group',
    authDomain: 'flutter-final-group.firebaseapp.com',
    storageBucket: 'flutter-final-group.appspot.com',
    measurementId: 'G-0MN693JSLG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUYWmpfrgpIXbE74_XXefKZIMoUbmLADo',
    appId: '1:589568007478:android:433e74b4d2882a199fe797',
    messagingSenderId: '589568007478',
    projectId: 'flutter-final-group',
    storageBucket: 'flutter-final-group.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDj8b0Harrz55izbdVZ3TH6ac3v5yvDIAE',
    appId: '1:589568007478:ios:13e40e283ae503099fe797',
    messagingSenderId: '589568007478',
    projectId: 'flutter-final-group',
    storageBucket: 'flutter-final-group.appspot.com',
    iosClientId:
        '589568007478-eofkd3k6g11b2onns8hg834743nsosmn.apps.googleusercontent.com',
    iosBundleId: 'com.example.talktribe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDj8b0Harrz55izbdVZ3TH6ac3v5yvDIAE',
    appId: '1:589568007478:ios:13e40e283ae503099fe797',
    messagingSenderId: '589568007478',
    projectId: 'flutter-final-group',
    storageBucket: 'flutter-final-group.appspot.com',
    iosClientId:
        '589568007478-eofkd3k6g11b2onns8hg834743nsosmn.apps.googleusercontent.com',
    iosBundleId: 'com.example.talktribe',
  );
}
