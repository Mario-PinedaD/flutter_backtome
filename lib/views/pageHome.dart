import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  final Color backgroundColor;

  // Constructor que recibe el color de fondo
  PageHome({required this.backgroundColor});

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  final ScrollController _scrollController = ScrollController();
  List<int> _items = List.generate(10, (index) => index); // Items iniciales
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    // Listener para detectar cuando el usuario llega al final del scroll
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !_isLoading) {
        _loadMoreItems();
      }
    });
  }

  // Simula la carga de más elementos
  void _loadMoreItems() async {
    setState(() {
      _isLoading = true;
    });

    // Simula un tiempo de carga
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _items.addAll(List.generate(
          10, (index) => _items.length + index)); // Agrega más elementos
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget
          .backgroundColor, // Usa el color de fondo que se pasó por el constructor
      body: Column(
        children: [
          SizedBox(height: 30),
          // Parte superior con nombre de usuario y notificaciones
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/user_image.png'), // Imagen del usuario
                  radius: 24.0,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Nombre del usuario',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(Icons.notifications),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount:
                  _items.length + 1, // +1 para mostrar el indicador de carga
              itemBuilder: (context, index) {
                if (index == _items.length) {
                  // Muestra un indicador de carga cuando se llegue al final de la lista
                  return _isLoading
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : SizedBox.shrink();
                }
                return _buildObjectCard();
              },
            ),
          ),
        ],
      ),
    );
  }

  // Método para construir las tarjetas de los objetos encontrados
  Widget _buildObjectCard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/user_image.png'), // Imagen del usuario
                    radius: 20.0,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Mario Pineda',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 150,
                color:
                    Colors.grey[300], // Placeholder para la imagen del objeto
              ),
              SizedBox(height: 10),
              Text(
                'Nombre del objeto',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Esta es una descripción del objeto que se haya encontrado para que se pueda mostrar en la página de inicio',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
