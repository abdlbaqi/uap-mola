// lib/main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';           // pastikan path benar
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // INI YANG HARUS PAKAI OPTIONS SECARA EXPLISIT BIAR GA ERROR DI WEB/WINDOWS
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyBank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0066FF)),
      ),
      home: const SplashScreen(),
      // Kalau mau langsung test login tanpa splash, ganti jadi:
      // home: const LoginScreen(),
    );
  }
}