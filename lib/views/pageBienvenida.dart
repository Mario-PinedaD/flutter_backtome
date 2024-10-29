import 'package:flutter/material.dart';
import 'package:flutter_backtome/views/pageLogin.dart';

class PageBienvenida extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/background.png'), // Asegúrate de tener esta imagen
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Botón de Iniciar Sesión
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: ElevatedButton(
                onPressed: () {
                  // Al dar clic, navega a la pantalla de inicio de sesión
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PageLogin()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Color del botón
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  "Iniciar Sesión",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
