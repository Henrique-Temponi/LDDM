import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Fazer log in',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Usario"),
              ))),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 400,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Senha"),
                  ))),
          ElevatedButton(
              onPressed: () {
                print("Ok");
              },
              child: const Text("Entrar"))
        ],
      ),
    );
  }
}
