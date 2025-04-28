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
    apiKey: "AIzaSyCkpDHYfArBtuZFGppPvpygE2puQhtp29g",
    authDomain: "flutterreceitas-d297e.firebaseapp.com",
    projectId: "flutterreceitas-d297e",
    storageBucket: "flutterreceitas-d297e.firebasestorage.app",
    messagingSenderId: "33582429979",
    appId: "1:33582429979:web:db7f21e9058df7dfd8c5be",
    measurementId: "G-6YB79PPZ9Y",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyCkpDHYfArBtuZFGppPvpygE2puQhtp29g",
    authDomain: "flutterreceitas-d297e.firebaseapp.com",
    projectId: "flutterreceitas-d297e",
    storageBucket: "flutterreceitas-d297e.firebasestorage.app",
    messagingSenderId: "33582429979",
    appId: "1:33582429979:web:db7f21e9058df7dfd8c5be",
    measurementId: "G-6YB79PPZ9Y",
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyCkpDHYfArBtuZFGppPvpygE2puQhtp29g",
    authDomain: "flutterreceitas-d297e.firebaseapp.com",
    projectId: "flutterreceitas-d297e",
    storageBucket: "flutterreceitas-d297e.firebasestorage.app",
    messagingSenderId: "33582429979",
    appId: "1:33582429979:web:db7f21e9058df7dfd8c5be",
    measurementId: "G-6YB79PPZ9Y",
  );
}
