import 'package:flutter/material.dart';

class PageCrearCuenta extends StatefulWidget {
  final Color background;
  //Constructor
  PageCrearCuenta({required this.background});
  @override
  // TODO: implement createElement
  _PageCrearCuentaState createState() => _PageCrearCuentaState();
}

class _PageCrearCuentaState extends State<PageCrearCuenta> {
  bool mantenerSesion = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.background,
      appBar: AppBar(
        title: Text('Crear cuenta'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            //Logo e imagen central
            Image.network(
              'https://via.placeholder.com/150',
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'Crea tu cuenta',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Ir a Back to me',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            // Campo Nombre
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            // Campo Apellidos
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Apellidos',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            // Campo Nombre de usuario
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Correo Electrónico',
                helperText: 'Ingresa un correo electrónico valido',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            // Campo Contraseña
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Contraseña (NIP)',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 15),
            // Campo Confirmación de contraseña
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Confirmación de contraseña',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 15),
            // Checkbox para mantener la sesión iniciada
            Row(
              children: [
                Checkbox(
                  value: mantenerSesion,
                  onChanged: (value) {
                    setState(() {
                      mantenerSesion = value ?? false;
                    });
                  },
                ),
                Text(
                  'Mantener inicio de sesión abierto',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
            SizedBox(height: 30),
            // Botón Crear cuenta
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
                print('Crear cuenta presionado');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                backgroundColor: Colors.blue[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Crear cuenta',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
