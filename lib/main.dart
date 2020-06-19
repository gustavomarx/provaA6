import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void _calculaFaixaEtaria(String myCont) {
    int anoNasc = int.parse(myCont);
    int anoAtual = 2020;
    int idade;
    setState(() {
      idade = anoAtual - anoNasc;

      if (idade >= 0 && idade <= 17) {
        if (idade >= 0 && idade <= 10) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("Sua idade é: $idade e sua faixa etária é Jovem - Categoria Infantil"),
              );
            },
          );
        }else if (idade >= 11 && idade <= 17) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("Sua idade é: $idade e sua faixa etária é Jovem - Categoria Juvenil"),
              );
            },
          );
        }
      } else if (idade >= 18 && idade <= 59) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Sua idade é: $idade e sua faixa etária é Adulto"),
            );
          },
        );
      } else if (idade >= 60) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Sua idade é: $idade e sua faixa etária é Idoso"),
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insira o seu ano de nascimento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _calculaFaixaEtaria(myController.text);
        },
        tooltip: "Clique para saber sua idade e faixa etária",
        child: Icon(Icons.assignment_ind),
      ),
    );
  }
}
