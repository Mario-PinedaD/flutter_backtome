import 'package:flutter/material.dart';
import 'package:flutter_backtome/views/pageHome.dart';
import 'package:flutter_backtome/views/pageRegister.dart';
import 'package:flutter_backtome/views/pageSearch.dart';
import 'package:flutter_backtome/views/pageUser.dart';

class PageAppGeneral extends StatefulWidget {
  final Color background;
  PageAppGeneral({required this.background});
  @override
  _PageAppGeneralState createState() => _PageAppGeneralState();
}

class _PageAppGeneralState extends State<PageAppGeneral> {
  // Colores del proyecto
  //final Color _backgroundAppColor = Color(0xFFF0ECF5);
  //final Color _backgroundAppColor = widget.background; //Color(0xFFE1EDFF);
  final Color _institutionalColor = Color(0xFF1B396A);
  int _selectedItems = 0;

  late List<Widget> _paginas;

  @override
  void initState() {
    super.initState();
    // Inicializar la lista de páginas en el initState
    _paginas = [
      PageHome(backgroundColor: widget.background),
      PageSearch(backgroundColor: widget.background),
      PageRegister(backgroundColor: widget.background),
      PageUser(
          background: widget.background, institucional: _institutionalColor),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.background, // Fondo variable
      body: _paginas[_selectedItems],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            _selectedItems, // Indice para saber en qué pestaña estamos
        onTap: (int index) {
          setState(() {
            _selectedItems = index;
          });
        },
        // Colores de la barra de navegación
        backgroundColor: widget.background,
        selectedItemColor: _institutionalColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Búsqueda',
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
    );
  }
}
