import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_backtome/views/pageCrearCuenta.dart';
import 'package:flutter_backtome/views/pageAppGeneral.dart';

class PageLogin extends StatefulWidget {
  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final Color _bacgroundColor = Color(0xFFE1EDFF);
  //Variables útiles para la autenticación
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //Variables para mensajes de error en caso de que alguno esté mal
  String? _correoError;
  String? _passwordError;

  //Métodos útiles para la autenticación:
  Future<void> _signIn(BuildContext contextLocal) async {
    //Método para seguir errores
    setState(() {
      _correoError = null;
      _passwordError = null;
    });
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _correoController.text.trim(),
        password: _passwordController.text.trim(),
      );
      print("Signed in as: ${userCredential.user?.email}");

      Navigator.pushReplacement(
        contextLocal,
        MaterialPageRoute(
          builder: (context) => PageAppGeneral(background: _bacgroundColor),
        ),
      );
    } catch (e) {
      // Aquí se maneja el error
      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-email') {
          setState(() {
            _correoError =
                "Correo Invalido o Inexistente"; // Actualiza el mensaje de error
          });
        } else if (e.code == 'wrong-password') {
          setState(() {
            _passwordError =
                "Contraseña incorrecta"; // Actualiza el mensaje de error
          });
        } else {
          setState(() {
            _correoError = "Error en el inicio de sesión"; // Mensaje genérico
          });
        }
      }
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  backgroundColor: Colors.white,
      //  elevation: 0,
      //  automaticallyImplyLeading: false, // Oculta el botón de retroceso
      //),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo y texto de la pantalla
            Image.asset(
              'lib/resources/itver_logo_sf.png',
              height: 100,
            ),
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
              controller: _correoController,
              decoration: InputDecoration(
                labelText: "Correo Electrónico",
                errorText: _correoError,
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Campo de contraseña
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Contraseña (NIP)",
                errorText: _passwordError,
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
                Text("Mantener sesión iniciada"),
              ],
            ),
            SizedBox(height: 20),
            // Botón de Iniciar Sesión
            ElevatedButton(
              onPressed: () => _signIn(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              ),
              child: Text(
                "Iniciar Sesión",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
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
                          PageCrearCuenta(background: _bacgroundColor),
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
