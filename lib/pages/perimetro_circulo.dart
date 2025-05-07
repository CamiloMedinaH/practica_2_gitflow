import 'dart:math';
import 'package:flutter/material.dart';

class PerimetroCirculo extends StatefulWidget {
  const PerimetroCirculo({super.key});

  @override
  State<PerimetroCirculo> createState() => _PerimetroCirculoState();
}

class _PerimetroCirculoState extends State<PerimetroCirculo> {

  final radio= TextEditingController();
  double valor_radio = 100;
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
                    Stack(
                      children: [
                        Container(
                          width: valor_radio,
                          height: valor_radio,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Positioned(
                          top: valor_radio/2,
                          left: valor_radio/2,
                          child: Container(
                            width: valor_radio,
                            height: 5,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: radio,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Valor del radio del circulo',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.circle_notifications),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Debe digitar un valor del radio calido';
                        } else {
                          if (!value!.isValidNumber()){
                            return 'Valor no valido para el radio';
                          }
                        }
                        return null;
                      }
                    ),
                    SizedBox(
                      height: 16,
                    ),
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
                        valor_radio = double.parse(radio.text)*100;
                        setState(() {
                          perimetro = 2 * (valor_radio/100) * pi;
                          if (valor_radio>500){
                            valor_radio=500;
                          } else {
                            valor_radio=valor_radio;
                          }
                        });
                      },
                      child: const Text('Calcular Perimetro')
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'El valor del perimetro del circulo es ${perimetro.toStringAsFixed(1)} cm²',
                      style: const TextStyle(
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    )


                    ]
                )
              )
            )
          )
        ]
      )
    );
  }
}

extension on String {
  bool isValidNumber() {
    return RegExp(r'^[0-9]+$').hasMatch(this);
  }
}