// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDXv4VqhfkVrh7AzdczkuL9IMARHWDchp4',
    appId: '1:464837912817:web:2c7728cd9aefb85aeb6150',
    messagingSenderId: '464837912817',
    projectId: 'notekeeper-cd08a',
    authDomain: 'notekeeper-cd08a.firebaseapp.com',
    storageBucket: 'notekeeper-cd08a.appspot.com',
    measurementId: 'G-EV0DNELDQX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDv31DejXgFVtG8i3lbR4ouJBhItcCSYoU',
    appId: '1:464837912817:android:830f847e5ecb4b53eb6150',
    messagingSenderId: '464837912817',
    projectId: 'notekeeper-cd08a',
    storageBucket: 'notekeeper-cd08a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBiE5AlJ95JsYG_r5rjIIR6rxcpDjosMpQ',
    appId: '1:464837912817:ios:41c794a8ccc9e2e6eb6150',
    messagingSenderId: '464837912817',
    projectId: 'notekeeper-cd08a',
    storageBucket: 'notekeeper-cd08a.appspot.com',
    iosBundleId: 'com.example.noteApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBiE5AlJ95JsYG_r5rjIIR6rxcpDjosMpQ',
    appId: '1:464837912817:ios:41c794a8ccc9e2e6eb6150',
    messagingSenderId: '464837912817',
    projectId: 'notekeeper-cd08a',
    storageBucket: 'notekeeper-cd08a.appspot.com',
    iosBundleId: 'com.example.noteApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDXv4VqhfkVrh7AzdczkuL9IMARHWDchp4',
    appId: '1:464837912817:web:7e6682ed724fe184eb6150',
    messagingSenderId: '464837912817',
    projectId: 'notekeeper-cd08a',
    authDomain: 'notekeeper-cd08a.firebaseapp.com',
    storageBucket: 'notekeeper-cd08a.appspot.com',
    measurementId: 'G-M498FKZ2EQ',
  );
}
