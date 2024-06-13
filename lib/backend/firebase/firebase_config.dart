import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAjMUccXZ28U7LgLOoqH4Axx3q8VwUPJdQ",
            authDomain: "wuriv1-z56esq.firebaseapp.com",
            projectId: "wuriv1-z56esq",
            storageBucket: "wuriv1-z56esq.appspot.com",
            messagingSenderId: "212165808008",
            appId: "1:212165808008:web:243565e5b8d661e038743d"));
  } else {
    await Firebase.initializeApp();
  }
}
