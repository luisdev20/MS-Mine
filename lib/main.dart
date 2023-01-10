import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:minems/infrastructure/controllers/router.dart';
// Import the generated file
import 'firebase_options.dart';
// For Firebase Auth
//import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
//import 'package:firebase_ui_auth/firebase_ui_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}