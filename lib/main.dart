import 'package:flutter/material.dart';
import 'package:flutter_backtome/views/pageCrearCuenta.dart';
import 'package:flutter_backtome/views/pageHome.dart';
import 'package:flutter_backtome/views/pageRegister.dart';

import 'views/pageUser.dart';
import 'views/pageSearch.dart';

// Se le indica a flutter que ejecute la app definida en MyApp
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Colores del proyecto
  final Color _backgroundColor = Color(0xFFF0ECF5);
  final Color _institutionalColor = Color(0xFF1B396A);
  int _selectedItems = 0;

  late List<Widget> _paginas;

  @override
  void initState() {
    super.initState();

    //Inicializar la lista en initState
    _paginas = [
      PageHome(backgroundColor: _backgroundColor),
      PageSearch(backgroundColor: _backgroundColor),
      PageRegister(backgroundColor: _backgroundColor),
      //Center(child: Text('Registrar')),
      PageUser(background: _backgroundColor),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: _backgroundColor, // Fondo variable
        body: _paginas[_selectedItems],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex:
              _selectedItems, //Indice para saber en que pestaña estamos
          onTap: (int index) {
            setState(() {
              _selectedItems = index;
            });
          },
          //Colores Barra de navegación
          backgroundColor: _backgroundColor,
          selectedItemColor: _institutionalColor,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Busqueda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Registrar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Usuario',
            ),
          ],
        ),
      ),
    );
  }
}
