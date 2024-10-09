import 'package:flutter/material.dart';
import 'package:lddm/card_item.dart';

class EditarMeta extends StatefulWidget {
  const EditarMeta({super.key});

  @override
  _EditarMetaState createState() => _EditarMetaState();
}

class _EditarMetaState extends State<EditarMeta> {
  var titleController = TextEditingController();
  var desController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as CardItem;
    titleController.text = todo.title;
    desController.text = todo.description;
    dateController.text = todo.date;

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
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Nome da meta"),
                  controller: titleController,
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Descricao"),
                  controller: desController,
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Data"),
                  controller: dateController,
                )),
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
