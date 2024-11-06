import 'package:flutter/material.dart';
import 'package:lddm/global/global_values.dart';
import 'package:lddm/metas_form.dart';
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
  void dispose() {
    _nomeController.dispose();
    _descriController.dispose();
    _dataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          MetasForm(
            nomeController: _nomeController,
            descriController: _descriController,
            dataController: _dataController,
            editText: "Adicionar Meta",
          ),
          ElevatedButton(
              onPressed: () async {
                int id = await SQLHelper.adicionarMeta(
                    _nomeController.text,
                    _descriController.text,
                    _dataController.text,
                    GlobalValues.iconValue);
                String resultado = "";
                if (id != 0) {
                  resultado = "Meta inserida com sucesso";
                  _nomeController.text = "";
                  _dataController.text = "";
                  _descriController.text = "";
                } else {
                  resultado = "Erro ao inserir Meta";
                }
                if (context.mounted) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(resultado)));
                }
              },
              child: const Text("Adicionar Meta"))
        ],
      ),
    );
  }
}
