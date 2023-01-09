import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:minems/application/use_cases/frmLogin.dart';
import 'package:minems/application/use_cases/frmManProfile.dart';
import 'package:minems/application/use_cases/frmRegister.dart';
// Import the generated file
import 'firebase_options.dart';
// To use GoRouter
import 'package:go_router/go_router.dart';
// For Firebase Auth
//import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
//import 'package:firebase_ui_auth/firebase_ui_auth.dart';

import 'package:minems/errorScreen.dart';
import 'package:minems/homeScreen.dart';
import 'package:minems/application/use_cases/userPage.dart';

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
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}

final _router = GoRouter(
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(
      name: "home",
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: "login",
      path: '/frmlogin',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: frmManProfile(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child)),
    ),
    GoRoute(
      name: "register",
      path: '/frmlogin/frmregister',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: frmRegister(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child)),
    ),
    GoRoute(
      name: "user",
      path: '/userpage',
      builder: (__, _) => const UserPage(),
    ),
  ],
);
