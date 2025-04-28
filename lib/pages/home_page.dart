import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Que quieres calcular?"),
              TextButton(
                  onPressed: () {},
                  child: const Text("Area Circulo")
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text("Perimetro Circulo")
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text("Area Cuadrado")
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text("Perimetro Cuadrado")
              )
            ],
          ),
        ),
      ),
    );
  }
}
