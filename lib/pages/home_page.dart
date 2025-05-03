import 'package:flutter/material.dart';
import 'package:practica_2_gitflow/pages/area_circulo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  final List<Widget> _pages = [
    AreaCirculo(),
    PerimetroCirculo(),
    AreaCuadrado(),
    PerimetroCuadrado(),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle), label: 'Area Circulo'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: 'Perimetro Circulo'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_rounded), label: 'Area Cuadrado'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined), label: 'Perimetro Circulo'),
        ],
      ),
    );
  }
}
/* Funcion para calcular el area
  class AreaCirculo extends StatelessWidget {
    @override
    Widget build(BuildContext constext) {
      return Scaffold(
        appBar: AppBar(title: Text('Perimetro circulo')),
        body: Center(child: Text('Perimetro')),
      );
    }
  }
*/

  class PerimetroCirculo extends StatelessWidget {
    @override
    Widget build(BuildContext constext) {
      return Scaffold(
        appBar: AppBar(title: Text('Perimetro circulo')),
        body: Center(child: Text('Perimetro')),
      );
    }
  }

  class AreaCuadrado extends StatelessWidget {
    @override
    Widget build(BuildContext constext) {
      return Scaffold(
        appBar: AppBar(title: Text('Area cuadrado')),
        body: Center(child: Text('Area')),
      );
    }
  }


  class PerimetroCuadrado extends StatelessWidget {
    @override
    Widget build(BuildContext constext) {
      return Scaffold(
        appBar: AppBar(title: Text('Perimetro cuadrado')),
        body: Center(child: Text('Perimetro')),
      );
    }
  }

