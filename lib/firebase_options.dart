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
    apiKey: 'AIzaSyDgqTaYRi7mgGkPJfyXn__Wr1i2XyHe2YM',
    appId: '1:191075341560:web:540dfd2f6628e20018170d',
    messagingSenderId: '191075341560',
    projectId: 'flash-chat-kurs14',
    authDomain: 'flash-chat-kurs14.firebaseapp.com',
    storageBucket: 'flash-chat-kurs14.appspot.com',
    measurementId: 'G-43G95PY30H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBUMfMALTHneZHZh4b7d6UJHM1v_tAOgRU',
    appId: '1:191075341560:android:8bbc3eb2c8acdd6818170d',
    messagingSenderId: '191075341560',
    projectId: 'flash-chat-kurs14',
    storageBucket: 'flash-chat-kurs14.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdZdtHrpgzRyPlxRLf4fL1NlWiO0lZzzc',
    appId: '1:191075341560:ios:a0f5771ce230da2718170d',
    messagingSenderId: '191075341560',
    projectId: 'flash-chat-kurs14',
    storageBucket: 'flash-chat-kurs14.appspot.com',
    iosBundleId: 'com.example.flashChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBdZdtHrpgzRyPlxRLf4fL1NlWiO0lZzzc',
    appId: '1:191075341560:ios:65107ffd6b8057dd18170d',
    messagingSenderId: '191075341560',
    projectId: 'flash-chat-kurs14',
    storageBucket: 'flash-chat-kurs14.appspot.com',
    iosBundleId: 'com.example.flashChat.RunnerTests',
  );
}
