import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minems/application/use_cases/frmRegister.dart';
import 'package:minems/application/use_cases/userPage.dart';
import 'package:minems/application/use_cases/errorScreen.dart';
import 'package:minems/application/use_cases/homeScreen.dart';

final router = GoRouter(
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
          child: UserPage(),
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
