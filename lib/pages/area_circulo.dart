import 'dart:math';

import 'package:flutter/material.dart';

class AreaCirculo extends StatefulWidget {
  const AreaCirculo({super.key});

  @override
  State<AreaCirculo> createState() => _AreaCirculoState();
}

class _AreaCirculoState extends State<AreaCirculo> {
  final radio =TextEditingController();
  double valor_radio = 100;
  double area = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Positioned.fill(//imagen de fondo
            child: Image.asset(
              'assets/images/Fondo.png',
              fit: BoxFit.cover, //para ajustar la imagen a la pantalla
            ),

          ),//Fondo
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
                          ), // Circulo
                          Positioned(
                            top: valor_radio/2, // Centro del circulo
                            left: valor_radio/2,
                            child: Container(
                              width: valor_radio, // longitud de la linea
                              height: 5, // grosor de la linea
                              color: Colors.black87,
                            ), //linea
                          ), //Coloca la linea encima del circulo
                        ],
                      ),
                      SizedBox(height: 16,),
                      TextFormField(
                        controller: radio,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Valor del radio del circulo",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.circle_notifications),

                        ),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty){
                            return "Debe digitar un valor del radio valido";
                          } else{
                            if (!value!.isValidNumber()){ //verifica si el valor solo tiene numeros
                              return "Valor no valido para el radio";
                            }
                          }
                          return null;

                        },

                      ), // radio de la figura
                      SizedBox(height: 16,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize:20,
                                fontStyle: FontStyle.italic,
                                color: Colors.black
                            ),
                            backgroundColor: Colors.white,
                            elevation: 20,
                          ),
                          onPressed:(){
                            valor_radio = double.parse(radio.text)*100 ;
                            setState(() {
                              area=pow(valor_radio/100, 2) * pi;
                              if (valor_radio>500){
                                valor_radio=500;
                              } else {
                                valor_radio=valor_radio;
                              }
                            });
                          },
                          child: const Text("Calcular Área")
                      ),
                      SizedBox(height: 16,),
                      Text(
                        "El valor de el área del circulo es ${area.toStringAsFixed(1)} cm²",
                        style: const TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                            color: Colors.white
                        ),
                      ), // el valor de la resistencia,
                      SizedBox(height: 16,),

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
extension on String{
  bool isValidNumber(){
    return RegExp(r'^[0-9]+$').hasMatch(this);
  }
}