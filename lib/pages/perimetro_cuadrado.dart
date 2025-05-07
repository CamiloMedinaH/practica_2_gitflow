import 'package:flutter/material.dart';

class PerimetroCuadrado extends StatefulWidget {
  const PerimetroCuadrado({super.key});

  @override
  State<PerimetroCuadrado> createState() => _PerimetroCuadradoState();
}

class _PerimetroCuadradoState extends State<PerimetroCuadrado> {
  final lado = TextEditingController();
  double valor_lado = 100; // tamaño en píxeles para mostrar el cuadrado
  double perimetro = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/Fondo.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: valor_lado,
                      height: valor_lado,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: lado,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Valor del lado del cuadrado (cm)",
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.crop_square),
                      ),
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Debe digitar un valor del lado válido";
                        } else {
                          if (!value.isValidNumber()) {
                            return "Valor no válido para el lado";
                          }
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                        backgroundColor: Colors.white,
                        elevation: 20,
                      ),
                      onPressed: () {
                        double lado_cm = double.parse(lado.text);
                        setState(() {
                          perimetro = lado_cm*4.toDouble();
                          valor_lado = lado_cm * 10; // Para visualización
                          if (valor_lado > 400) {
                            valor_lado = 400;
                          }
                        });
                      },
                      child: const Text("Calcular Perímetro"),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "El valor del Perímetro del cuadrado es ${perimetro.toStringAsFixed(1)} cm",
                      style: const TextStyle(
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
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

extension on String {
  bool isValidNumber() {
    return RegExp(r'^[0-9]+$').hasMatch(this);
  }
}
