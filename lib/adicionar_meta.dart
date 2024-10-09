import 'package:flutter/material.dart';

class AdicionarMeta extends StatefulWidget {
  const AdicionarMeta({super.key});

  @override
  _AdicionarMetaState createState() => _AdicionarMetaState();
}

class _AdicionarMetaState extends State<AdicionarMeta> {
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
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Nome da meta"),
              ))),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 400,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Descricao"),
                  ))),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 400,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Data"),
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
