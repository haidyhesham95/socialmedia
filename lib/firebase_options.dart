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
    apiKey: 'AIzaSyAQ7F6J03VZSyVtn-dRqfPAD_oBnbbE-zw',
    appId: '1:1088152695081:web:b6c38159fba003f1790738',
    messagingSenderId: '1088152695081',
    projectId: 'instgram-4eed9',
    authDomain: 'instgram-4eed9.firebaseapp.com',
    storageBucket: 'instgram-4eed9.appspot.com',
    measurementId: 'G-FLT5FSDQEQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCinMHkT00xghxAJg5IKPQ2k6Afc1CsFQQ',
    appId: '1:1088152695081:android:053b4735ea13df90790738',
    messagingSenderId: '1088152695081',
    projectId: 'instgram-4eed9',
    storageBucket: 'instgram-4eed9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCe0WedJiEq41an6X653_Gie8GO7-MVlHE',
    appId: '1:1088152695081:ios:f76653c223484501790738',
    messagingSenderId: '1088152695081',
    projectId: 'instgram-4eed9',
    storageBucket: 'instgram-4eed9.appspot.com',
    iosBundleId: 'com.example.instgram',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCe0WedJiEq41an6X653_Gie8GO7-MVlHE',
    appId: '1:1088152695081:ios:f76653c223484501790738',
    messagingSenderId: '1088152695081',
    projectId: 'instgram-4eed9',
    storageBucket: 'instgram-4eed9.appspot.com',
    iosBundleId: 'com.example.instgram',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAQ7F6J03VZSyVtn-dRqfPAD_oBnbbE-zw',
    appId: '1:1088152695081:web:b0b6f51d12ed5de5790738',
    messagingSenderId: '1088152695081',
    projectId: 'instgram-4eed9',
    authDomain: 'instgram-4eed9.firebaseapp.com',
    storageBucket: 'instgram-4eed9.appspot.com',
    measurementId: 'G-M6VZS77MHT',
  );
}
