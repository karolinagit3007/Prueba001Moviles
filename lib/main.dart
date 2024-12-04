import 'package:flutter/material.dart';
import 'package:prueba_001/screens/Pantalla2.dart'; 
import '../navigadores/drawer.dart';

void main() {
  runApp(const Pantalla1());
}

class Pantalla1 extends StatelessWidget {
  const Pantalla1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pantalla 1',
          style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1), 
          ),
        ),
        backgroundColor: const Color.fromRGBO(224, 51, 51, 1), 
      ),
      drawer: MiDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Nombre: Karolina Gavilema "), 
          const Text("Usuario de GitHub: karolinagit3007"), 
          const SizedBox(height: 20),
          pagina_btn(context),
          imagenLocal(),
        ],
      ),
    );
  }
}


Widget pagina_btn(BuildContext context) {
  return ElevatedButton.icon(
    onPressed: () => navegar02(context),
    label: const Text("Ir a la página 2"),
    icon: const Icon(Icons.navigate_next_outlined),
  );
}


void navegar02(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('¿Deseas ir al Ejercicio 02?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context); 
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Pantalla2()),
              );
            },
            child: const Text('Aceptar'),
          ),
        ],
      );
    },
  );
}


//IMAGEN LOCAL
Widget imagenLocal(){
  return Image.asset("assets/images/main.webp");
}
