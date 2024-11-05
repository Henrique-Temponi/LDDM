import 'package:flutter/material.dart';
import 'package:lddm/card_item.dart';
import 'package:lddm/metas_form.dart';

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
  void dispose() {
    titleController.dispose();
    desController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todo =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    titleController.text = todo['nome'];
    desController.text = todo['descricao'];
    // dateController.text = todo['data'];

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
            MetasForm(
                nomeController: titleController,
                descriController: desController,
                dataController: dateController,
                editText: "Editar Metas"),
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
