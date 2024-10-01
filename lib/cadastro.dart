import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    //Limpar os metodos ate coluna
    return DefaultTextStyle.merge(
        child: Container(
      padding: const EdgeInsets.all(20),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        const Center(child: Text("Tela de cadastro")),
        const Padding(
            padding: EdgeInsets.all(20),
            child: SizedBox(
                width: 400,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Usuario"),
                ))),
        const Padding(
            padding: EdgeInsets.all(20),
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
      ]),
    ));
  }
}
