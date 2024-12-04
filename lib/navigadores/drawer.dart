


import 'package:flutter/material.dart';
import 'package:prueba_001/main.dart';
import 'package:prueba_001/screens/Pantalla2.dart';
import 'package:prueba_001/screens/Pantalla3.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Pantalla 01"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Pantalla1())),
          ),
          ListTile(
            title: Text("Pantalla 02"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Pantalla2())),
          ),
          ListTile(
            title: Text("Pantalla 03"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Pantalla3())),
          ),
          
          
        ],

      ),
      
    );
  }
}