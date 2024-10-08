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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDMGTh1BGRnWstl-ib9aYrg7z1qPz1-5YU',
    appId: '1:988144644924:android:02f2fb306d500dab686439',
    messagingSenderId: '988144644924',
    projectId: 'fir-testing-f8429',
    storageBucket: 'fir-testing-f8429.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhYkud1Xf5ZHA4fSNgRAshn40hOPjNk-c',
    appId: '1:988144644924:ios:8c143fbc72de7084686439',
    messagingSenderId: '988144644924',
    projectId: 'fir-testing-f8429',
    storageBucket: 'fir-testing-f8429.appspot.com',
    androidClientId: '988144644924-64ir1hln3r7fes0mbnvru30ni1op6o4d.apps.googleusercontent.com',
    iosClientId: '988144644924-5jjlfnp9avo459nptl56k5ns38mou8jq.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseTesting',
  );

}