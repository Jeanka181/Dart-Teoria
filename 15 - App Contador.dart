import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  // propiedades de la calse
  int contador = 0;

  //metodos de la clase
  void incrementarFN() {
    contador++;
    setState(() {});
  }

  void decrementarFN() {
    contador--;
    setState(() {});
  }

  void resetearFN() {
    contador = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const lblSize30 = TextStyle(fontSize: 30);
    const valSize30 = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('My first app')),
        elevation: 3.5,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Numero de clicks:',
              style: lblSize30,
            ),
            Text('$contador', style: valSize30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomActionButton(
        aumentarValor: incrementarFN,
        disminuirValor: decrementarFN,
        resetearValor: resetearFN,
      ),
    );
  }
}

class CustomActionButton extends StatelessWidget {
  //propiedades
  final Function aumentarValor;
  final Function disminuirValor;
  final Function resetearValor;

  //Constructor
  const CustomActionButton(
      {Key? key,
      required this.aumentarValor,
      required this.disminuirValor,
      required this.resetearValor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
            child: const Icon(Icons.exposure_plus_1_outlined),
            onPressed: () => aumentarValor()),
        FloatingActionButton(
            child: const Icon(Icons.exposure_outlined),
            onPressed: () => resetearValor()),
        FloatingActionButton(
            child: const Icon(Icons.exposure_minus_1_outlined),
            onPressed: () => disminuirValor()),
      ],
    );
  }
}
