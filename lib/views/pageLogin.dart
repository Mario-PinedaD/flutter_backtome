import 'package:flutter/material.dart';
import 'package:flutter_backtome/views/pageCrearCuenta.dart';

class Pagelogin extends StatelessWidget {
  final Color _institutionalColor = Color(0xFF1B396A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        elevation: 0,
        automaticallyImplyLeading: false, // Oculta el botón de retroceso
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo y texto de la pantalla
            Text(
              "LOG IN",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Campo de usuario
            TextField(
              decoration: InputDecoration(
                labelText: "Usuario",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Campo de contraseña
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Contraseña (NIP)",
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Recordar contraseña checkbox
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(value: false, onChanged: (bool? value) {}),
                Text("Recordar contraseña"),
              ],
            ),
            SizedBox(height: 20),
            // Botón de Iniciar Sesión
            ElevatedButton(
              onPressed: () {
                // Aquí puedes agregar la lógica para iniciar sesión
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              ),
              child: Text("Iniciar Sesión"),
            ),
            SizedBox(height: 20),
            // Botón de Crear Cuenta
            TextButton(
              onPressed: () {
                // Navegar a la pantalla de Crear Cuenta
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PageCrearCuenta(background: _institutionalColor),
                    ));
              },
              child: Text(
                "Crear Cuenta",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
