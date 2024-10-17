import 'package:flutter/material.dart';

class PageShare extends StatelessWidget {
  final Color backgroundColor;

  PageShare({required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text("Compartir objeto"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/avatar.png"), // Imagen del usuario
                ),
                SizedBox(width: 10),
                Text(
                  "Mario Pineda", // Nombre del usuario
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 150,
              color: Colors.grey[300], // Aquí iría la imagen del objeto
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "¿Qué objeto encontraste?",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "¿Dónde lo encontraste?",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "¿A quién se lo entregaste?",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "¿En dónde lo dejaste?",
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para compartir el objeto
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1B396A), // Color del botón
                ),
                child: Text("Compartir"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
