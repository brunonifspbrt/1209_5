import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController contP = TextEditingController();
  TextEditingController contA = TextEditingController();

  double numero = 0;

  void calculo() {
    double valP, valA, res = 0;
    String val = '';
    val = contP.text;
    val = val.replaceAll(',', '.');
    valP = double.parse(val);
    val = contA.text;
    val = val.replaceAll(',', '.');
    valA = double.parse(val);

    if (valA > 0) {
      res = valP / (valA * valA);
      setState(() {
        numero = res;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('Calculadora de IMC')),
          body: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: TextField(
                      // Ajuste do controlador
                      controller: contA,
                      decoration: InputDecoration(
                          labelText: "Altura (m):",
                          labelStyle: TextStyle(fontSize: 25)),
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: TextField(
                        // Ajuste do controlador
                        controller: contP,
                        style: TextStyle(fontSize: 25),
                        decoration: InputDecoration(
                            labelText: "Peso (kg):",
                            labelStyle: TextStyle(fontSize: 25))),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    calculo();
                  },
                  child: const Text('Calcular IMC'),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: Text(
                      // exibindo valor do controlador:
                      'Resultado: ' + numero.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 32,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
