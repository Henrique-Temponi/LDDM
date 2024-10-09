import 'package:flutter/material.dart';
import 'package:lddm/card_item.dart';

class EditarMeta extends StatefulWidget {
  final CardItem metaDados;
  const EditarMeta({super.key, required this.metaDados});

  @override
  _EditarMetaState createState() => _EditarMetaState();
}

class _EditarMetaState extends State<EditarMeta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar"),
      ),
      body: Container(
        color: Colors.grey[300],
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Editar Meta',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(8.0),
                child: Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Nome da meta"),
                    // controller: ,
                  ),
                )),
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
      ),
    );
  }
}
