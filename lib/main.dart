import 'package:flutter/material.dart';
import 'package:flutter_backtome/views/pageCrearCuenta.dart';

// Se le indica a flutter que ejecute la app definida en MyApp
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Color _backgroundAppColor = Color(0xFFE1EDFF);
  final Color _institutionalColor = Color(0xFF1B396A);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mi aplicación',
        theme: ThemeData(
          primaryColor: _institutionalColor,
          scaffoldBackgroundColor: _backgroundAppColor,
        ),
        home: PageCrearCuenta(background: _backgroundAppColor));
  }
}
