import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_option.dart';
import 'homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mahasiswa App',
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}