import 'package:flutter/material.dart';

class Pantalla2 extends StatefulWidget {
  const Pantalla2({super.key});

  @override
  _Pantalla2State createState() => _Pantalla2State();
}

class _Pantalla2State extends State<Pantalla2> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();

  String _resultadoIMC = "";

  void _calcularIMC() {
    double peso = double.tryParse(_pesoController.text) ?? 0;
    double altura = double.tryParse(_alturaController.text) ?? 0;

    if (peso <= 0 || altura <= 0) {
      setState(() {
        _resultadoIMC = "Por favor ingrese valores válidos para peso y altura.";
      });
      return;
    }

    double imc = peso / (altura * altura);

    String interpretacion = "";
    if (imc < 18.5) {
      interpretacion = "Bajo peso";
    } else if (imc >= 18.5 && imc <= 24.9) {
      interpretacion = "Peso normal";
    } else if (imc >= 25.0 && imc <= 29.9) {
      interpretacion = "Sobrepeso";
    } else {
      interpretacion = "Obesidad";
    }

    setState(() {
      _resultadoIMC = "IMC: ${imc.toStringAsFixed(2)}\n$interpretacion";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo IMC'),
        backgroundColor: const Color.fromARGB(255, 115, 179, 231),
      ),
      body: Stack(
        children: [
          // Fondo con la imagen
          Positioned.fill(
            child: Image.network(
              "https://imgs.search.brave.com/B14acdbVsvAxYksycbvT2VhWWzn7Bcjlt7rNMPhiLOI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/Zm90by1ncmF0aXMv/Zm9uZG8tdGV4dHVy/YXMtcGFyZWQtbGFk/cmlsbG8tYmxhbmNv/Xzc0MTkwLTM0NTEu/anBnP3NlbXQ9YWlz/X2h5YnJpZA",
              fit: BoxFit.cover, 
            ),
          ),
          
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80), 

                    // Título
                    const Text(
                      "Cálculo de IMC",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 30), 

                    TextField(
                      controller: _pesoController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Peso (kg)",
                        labelStyle: TextStyle(color: Color.fromARGB(255, 15, 13, 13)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 7, 6, 6)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: _alturaController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Altura (m)",
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

                    // Botón de calcular IMC
                    FilledButton(
                      onPressed: _calcularIMC,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      child: const Text(
                        "Calcular IMC",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Resultado del IMC
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        _resultadoIMC,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 0, 0),
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
