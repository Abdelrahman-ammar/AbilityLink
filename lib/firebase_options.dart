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
    apiKey: 'AIzaSyAjv6kEOvJG-uxetEpUMMC1hpGzlVqg8Vo',
    appId: '1:733410490264:web:e6c3a40ccfa421906a9ded',
    messagingSenderId: '733410490264',
    projectId: 'abilitylinkapp',
    authDomain: 'abilitylinkapp.firebaseapp.com',
    storageBucket: 'abilitylinkapp.appspot.com',
    measurementId: 'G-RL2HBWQWQS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjTZcOWVctOHDs26DwNUGrlvW4hT60p3A',
    appId: '1:733410490264:android:35e721c6323d0a116a9ded',
    messagingSenderId: '733410490264',
    projectId: 'abilitylinkapp',
    storageBucket: 'abilitylinkapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCP7_6Gt17gOGbAwWALmIOzAodDXaAj2Do',
    appId: '1:733410490264:ios:8d9c6bb7741061826a9ded',
    messagingSenderId: '733410490264',
    projectId: 'abilitylinkapp',
    storageBucket: 'abilitylinkapp.appspot.com',
    iosBundleId: 'com.example.newGradProj',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCP7_6Gt17gOGbAwWALmIOzAodDXaAj2Do',
    appId: '1:733410490264:ios:783476a152bcd9146a9ded',
    messagingSenderId: '733410490264',
    projectId: 'abilitylinkapp',
    storageBucket: 'abilitylinkapp.appspot.com',
    iosBundleId: 'com.example.newGradProj.RunnerTests',
  );
}