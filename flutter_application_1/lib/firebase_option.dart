// File generated manually from your Firebase config info.

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCtI_tTcfKOEJncfwewPeGt0X_DoY0ptFM',
    authDomain: 'tugas-mahasiswa-cc639.firebaseapp.com',
    databaseURL: 'https://tugas-mahasiswa-cc639-default-rtdb.asia-southeast1.firebasedatabase.app',
    projectId: 'tugas-mahasiswa-cc639',
    storageBucket: 'tugas-mahasiswa-cc639.firebasestorage.app',
    messagingSenderId: '821483249479',
    appId: '1:821483249479:web:9ca19b5ab2c42cc6ec7662',
    measurementId: 'G-GHWMMF9MDV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtI_tTcfKOEJncfwewPeGt0X_DoY0ptFM',
    appId: '1:821483249479:android:5e380d02a20fd3dcec7662', // Replace with your Android appId
    messagingSenderId: '821483249479',
    projectId: 'tugas-mahasiswa-cc639',
    storageBucket: 'tugas-mahasiswa-cc639.firebasestorage.app',
    databaseURL: 'https://tugas-mahasiswa-cc639-default-rtdb.asia-southeast1.firebasedatabase.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCtI_tTcfKOEJncfwewPeGt0X_DoY0ptFM',
    appId: '1:821483249479:ios:b2f79820a3193d5dec7662', // Replace with your iOS appId
    messagingSenderId: '821483249479',
    projectId: 'tugas-mahasiswa-cc639',
    storageBucket: 'tugas-mahasiswa-cc639.firebasestorage.app',
    iosBundleId: 'YOUR_IOS_BUNDLE_ID', // Replace with your iOS bundle id
  );
}
