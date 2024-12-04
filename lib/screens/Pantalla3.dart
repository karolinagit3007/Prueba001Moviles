import 'package:flutter/material.dart';
import '../navigadores/drawer.dart';

class Pantalla3 extends StatefulWidget {
  const Pantalla3({super.key});

  @override
  _Pantalla3State createState() => _Pantalla3State();
}

class _Pantalla3State extends State<Pantalla3> {
  final TextEditingController _velocidadController = TextEditingController();

  String _resultadoDistancia = "";

  void _calcularDistancia() {
    double velocidad = double.tryParse(_velocidadController.text) ?? 0;
    const double tiempo = 100; // El tiempo es constante, 100 segundos

    if (velocidad <= 0) {
      setState(() {
        _resultadoDistancia = "Por favor ingrese un valor válido para la velocidad.";
      });
      return;
    }

    double distancia = velocidad * tiempo;

    setState(() {
      _resultadoDistancia = "Distancia recorrida: ${distancia.toStringAsFixed(2)} metros";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de Distancia'),
        backgroundColor: const Color.fromARGB(255, 115, 179, 231),
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.network(
              "https://imgs.search.brave.com/B14acdbVsvAxYksycbvT2VhWWzn7Bcjlt7rNMPhiLOI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/Zm90by1ncmF0aXMv/Zm9uZG8tdGV4dHVy/YXMtcGFyZWQtbGFk/cmlsbG8tYmxhbmNv/Xzc0MTkwLTM0NTEu/anBnP3NlbXQ9YWlz/X2h5YnJpZA",
              fit: BoxFit.cover,
            ),
          ),
          
          // Contenido centrado
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80), // Espacio arriba

                    // Título
                    const Text(
                      "Cálculo de Distancia",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 36, 66, 201),
                      ),
                    ),
                    const SizedBox(height: 30), // Espacio entre el título y los campos

                    // Campo de entrada para velocidad
                    TextField(
                      controller: _velocidadController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Velocidad (m/s)",
                        labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),

                    const SizedBox(height: 30),

                    // Botón para calcular distancia
                    FilledButton(
                      onPressed: _calcularDistancia,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 45, 62, 214)),
                      ),
                      child: const Text(
                        "Calcular Distancia",
                        style: TextStyle(color: Color.fromARGB(255, 247, 247, 247)),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Resultado de la distancia
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        _resultadoDistancia,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 14, 12, 12),
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
