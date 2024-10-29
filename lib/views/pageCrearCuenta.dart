import 'package:flutter/material.dart';
import 'package:flutter_backtome/views/pageAppGeneral.dart';
//Importar librerías para autenticación
import 'package:firebase_auth/firebase_auth.dart';

class PageCrearCuenta extends StatefulWidget {
  final Color background;
  //Constructor
  PageCrearCuenta({required this.background});
  @override
  // TODO: implement createElement
  _PageCrearCuentaState createState() => _PageCrearCuentaState();
}

class _PageCrearCuentaState extends State<PageCrearCuenta> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool mantenerSesion = false;
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> _signUp() async {
    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _correoController.text.trim(),
          password: _passwordController.text.trim(),
        );
        print("User registered: ${userCredential.user?.email}");

        // Navega a la pantalla principal
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageAppGeneral(background: widget.background),
          ),
        );
      } catch (e) {
        print("Error: $e");
      }
    } else {
      print("Las contraseñas no coinciden");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.background,
      appBar: AppBar(
        title: Text('Crear cuenta'),
        //backgroundColor: Colors.black,
        backgroundColor: widget.background,
      ),
      //body: SingleChildScrollView(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'CREA TU CUENTA',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Y conmencemos a ayudar',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            // Campo Nombre
            TextFormField(
              controller: _nombreController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 15),
            // Campo Apellidos
            TextFormField(
              controller: _apellidosController,
              decoration: InputDecoration(
                labelText: 'Apellidos',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 15),
            // Campo Nombre de usuario
            TextFormField(
              controller: _correoController,
              decoration: InputDecoration(
                labelText: 'Correo Electrónico',
                helperText: 'Ingresa un correo electrónico valido',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 15),
            // Campo Contraseña
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: true,
            ),
            SizedBox(height: 15),
            // Campo Confirmación de contraseña
            TextFormField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirmación de contraseña',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
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
              onPressed: _signUp,
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  backgroundColor: Colors.blue[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: Text(
                'Crear cuenta',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
