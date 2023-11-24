import 'package:flutter/material.dart';
import 'package:prova_flutter/src/core/routes.dart';
import 'package:prova_flutter/src/presentation/login/login_page.dart';

void main() {
  runApp(const ProvaApp());
}

class ProvaApp extends StatelessWidget {
  const ProvaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prova Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginPage.pageName,
      onGenerateRoute: onGenerateRoute,
      onUnknownRoute: onUnknownRoute,
    );
  }
}
