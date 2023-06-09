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
    apiKey: 'AIzaSyAE78vqorqH8kUtL1bJ6o9fZUJlK9wqeWo',
    appId: '1:55416166534:web:430eb57026aac3ebefd907',
    messagingSenderId: '55416166534',
    projectId: 'splitapp-30e86',
    authDomain: 'splitapp-30e86.firebaseapp.com',
    storageBucket: 'splitapp-30e86.appspot.com',
    measurementId: 'G-CNNREP3D58',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyChGwArc7oWOX1mnEe2Vx_YbAueRjaKqno',
    appId: '1:55416166534:android:349e6a24f95ff97defd907',
    messagingSenderId: '55416166534',
    projectId: 'splitapp-30e86',
    storageBucket: 'splitapp-30e86.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBux69WilxHGT735v8FVeYaAMXscHGYP8',
    appId: '1:55416166534:ios:088808f62a230395efd907',
    messagingSenderId: '55416166534',
    projectId: 'splitapp-30e86',
    storageBucket: 'splitapp-30e86.appspot.com',
    iosClientId: '55416166534-f7qievcsel92ujd6k9mjkpshoq0h7k6r.apps.googleusercontent.com',
    iosBundleId: 'com.example.splittingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBBux69WilxHGT735v8FVeYaAMXscHGYP8',
    appId: '1:55416166534:ios:088808f62a230395efd907',
    messagingSenderId: '55416166534',
    projectId: 'splitapp-30e86',
    storageBucket: 'splitapp-30e86.appspot.com',
    iosClientId: '55416166534-f7qievcsel92ujd6k9mjkpshoq0h7k6r.apps.googleusercontent.com',
    iosBundleId: 'com.example.splittingApp',
  );
}
