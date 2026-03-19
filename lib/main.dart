import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase Initialization
  await Firebase.initializeApp();
  // Dependency Injection
  // Start App
}
