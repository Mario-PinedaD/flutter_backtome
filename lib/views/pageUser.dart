import 'package:flutter/material.dart';

class Pageuser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Paguna Usuario"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Pineda Domínguez',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Mario Alfredo',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.blue[800],
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OptionButton(
                            icon: Icons.account_circle,
                            label: 'Información de la cuenta'),
                        SizedBox(height: 20),
                        OptionButton(
                            icon: Icons.history, label: 'Historial de Objetos'),
                        SizedBox(height: 20),
                        OptionButton(
                            icon: Icons.contact_support,
                            label: 'Contacto y Soporte')
                      ])))
        ],
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  OptionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          SizedBox(width: 20),
          Icon(icon, size: 30, color: Colors.black),
          SizedBox(width: 20),
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
