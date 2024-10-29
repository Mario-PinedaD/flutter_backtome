import 'package:flutter/material.dart';
import 'package:flutter_backtome/views/pageLogin.dart';
//Cositas de FireBase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Se le indica a flutter que ejecute la app definida en MyApp
Future<void> main() async {
  //Se asegura que esté inicializado
  WidgetsFlutterBinding.ensureInitialized();

  // Espera a que inicialice Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        //home: PageCrearCuenta(background: _backgroundAppColor));
        home: PageLogin());
  }
}
