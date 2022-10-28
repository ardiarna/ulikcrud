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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBNJjOpvj51MqvmWwm6hmz_9-l1Booc0Ng',
    appId: '1:264161846436:web:14cd08d130e057a6197231',
    messagingSenderId: '264161846436',
    projectId: 'ulik-crud',
    authDomain: 'ulik-crud.firebaseapp.com',
    databaseURL: 'https://ulik-crud-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ulik-crud.appspot.com',
    measurementId: 'G-6M7Q1449ZG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6sy9sS91Ld9m2JWYIagFqFKIckUPlxe0',
    appId: '1:264161846436:android:31a56484c3add86b197231',
    messagingSenderId: '264161846436',
    projectId: 'ulik-crud',
    databaseURL: 'https://ulik-crud-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ulik-crud.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDMKANvknZOdhX9V_B_siR_X7vWjlo8UV4',
    appId: '1:264161846436:ios:6f1f57b74acfbff4197231',
    messagingSenderId: '264161846436',
    projectId: 'ulik-crud',
    databaseURL: 'https://ulik-crud-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ulik-crud.appspot.com',
    iosClientId: '264161846436-87jp1f7na6thh0tjnl54hn907se22soi.apps.googleusercontent.com',
    iosBundleId: 'com.ufe.ulikcrud',
  );
}