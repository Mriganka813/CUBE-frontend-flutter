// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

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
    // if (kIsWeb) {
    //   return web;
    // }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      // case TargetPlatform.iOS:
      //   return ios;
      // case TargetPlatform.macOS:
      //   throw UnsupportedError(
      //     'DefaultFirebaseOptions have not been configured for macos - '
      //     'you can reconfigure this by running the FlutterFire CLI again.',
      //   );
      // case TargetPlatform.windows:
      //   throw UnsupportedError(
      //     'DefaultFirebaseOptions have not been configured for windows - '
      //     'you can reconfigure this by running the FlutterFire CLI again.',
      //   );
      // case TargetPlatform.linux:
      //   throw UnsupportedError(
      //     'DefaultFirebaseOptions have not been configured for linux - '
      //     'you can reconfigure this by running the FlutterFire CLI again.',
      //   );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  // static const FirebaseOptions web = FirebaseOptions(
  //   apiKey: 'AIzaSyC2nYC6_EG3JGibJ3CJzxga6L9McDQHqu4',
  //   appId: '1:716795950025:web:6b1646ef6f36b1f996ee18',
  //   messagingSenderId: '716795950025',
  //   projectId: 'magicstep-ca8f1',
  //   authDomain: 'magicstep-ca8f1.firebaseapp.com',
  //   storageBucket: 'magicstep-ca8f1.appspot.com',
  //   measurementId: 'G-PVG8EJQMR8',
  // );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCGcuHC2xtofijOCzDQmSKRHAfghK9H0xQ',
    appId: '1:1025146175164:android:ef58c6d31e15999ee99ab9',
    messagingSenderId: '1025146175164',
    projectId: 'cute-f8bbc',
    storageBucket: 'cute-f8bbc.appspot.com',
  );

  // static const FirebaseOptions ios = FirebaseOptions(
  //   apiKey: 'AIzaSyDeg3_6u4BCi7CSNIbgoj3OzQvTxg0FC4Q',
  //   appId: '1:716795950025:ios:0f0164222804678e96ee18',
  //   messagingSenderId: '716795950025',
  //   projectId: 'magicstep-ca8f1',
  //   storageBucket: 'magicstep-ca8f1.appspot.com',
  //   androidClientId: '716795950025-05nk5lg38cgb4tobhrma8s8h780ks9td.apps.googleusercontent.com',
  //   iosClientId: '716795950025-b5bod5cb2s5kmgiq6gedrf1jd88vtojb.apps.googleusercontent.com',
  //   iosBundleId: 'com.shopos.magicstep',
  // );
}
