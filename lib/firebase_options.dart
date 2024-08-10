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
    apiKey: 'AIzaSyB4i9SjWsNEhDUtqi522DrxdVoNJllWIgM',
    appId: '1:449508062169:web:06691b3a3220fad530dfc8',
    messagingSenderId: '449508062169',
    projectId: 'product-list-flutter',
    authDomain: 'product-list-flutter.firebaseapp.com',
    storageBucket: 'product-list-flutter.appspot.com',
    measurementId: 'G-H0QYR3LZD2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJlWV_jspS6J_0cEPvs9axzeGej2jBcRE',
    appId: '1:449508062169:android:369823e7284c5b4630dfc8',
    messagingSenderId: '449508062169',
    projectId: 'product-list-flutter',
    storageBucket: 'product-list-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB4jb81DS7B1cPqEhPE1rUR6Ya7RCR4Kvc',
    appId: '1:449508062169:ios:6d995732b8e4171530dfc8',
    messagingSenderId: '449508062169',
    projectId: 'product-list-flutter',
    storageBucket: 'product-list-flutter.appspot.com',
    iosBundleId: 'com.artashes.testProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB4jb81DS7B1cPqEhPE1rUR6Ya7RCR4Kvc',
    appId: '1:449508062169:ios:6d995732b8e4171530dfc8',
    messagingSenderId: '449508062169',
    projectId: 'product-list-flutter',
    storageBucket: 'product-list-flutter.appspot.com',
    iosBundleId: 'com.artashes.testProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB4i9SjWsNEhDUtqi522DrxdVoNJllWIgM',
    appId: '1:449508062169:web:f560bfec7d8ebfb630dfc8',
    messagingSenderId: '449508062169',
    projectId: 'product-list-flutter',
    authDomain: 'product-list-flutter.firebaseapp.com',
    storageBucket: 'product-list-flutter.appspot.com',
    measurementId: 'G-R4JG680D4S',
  );
}
