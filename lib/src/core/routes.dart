import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:prova_flutter/src/presentation/login/login_page.dart';

Route<dynamic> onUnknownRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) {
      log('Unknown route');
      return const Scaffold(
        body: Center(
          child: Text('Rota desconhecida'),
        ),
      );
    },
  );
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
    case LoginPage.pageName:
      return PageRouteBuilder(
        settings: const RouteSettings(name: LoginPage.pageName),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );

    default:
      return onUnknownRoute(settings);
  }
}
