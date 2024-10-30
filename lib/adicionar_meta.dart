import 'package:flutter/material.dart';
import 'package:lddm/sql_helper.dart';

class AdicionarMeta extends StatefulWidget {
  const AdicionarMeta({super.key});

  @override
  _AdicionarMetaState createState() => _AdicionarMetaState();
}

class _AdicionarMetaState extends State<AdicionarMeta> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descriController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

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
              'Adicionar Meta',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _nomeController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Nome da meta"),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _descriController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Descricao"),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _dataController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Data"),
              )),
          ElevatedButton(
              onPressed: () async {
                int id = await SQLHelper.adicionarMeta(_nomeController.text,
                    _descriController.text, _dataController.text, 0xe51c);
                String resultado = "";
                if (id != 0) {
                  resultado = "Meta inserida com sucesso";
                } else {
                  resultado = "Erro ao inseri Meta";
                }
                if (context.mounted) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(resultado)));
                }
              },
              child: const Text("Entrar"))
        ],
      ),
    );
  }
}
