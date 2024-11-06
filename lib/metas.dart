import 'package:flutter/material.dart';
import 'package:lddm/editar_meta.dart';
import 'package:lddm/sql_helper.dart';

class Meta extends StatefulWidget {
  const Meta({super.key});

  @override
  _MetaState createState() => _MetaState();
}

class _MetaState extends State<Meta> {
  List<Map<String, dynamic>> _lista = [];

  void _atualizaMetas() async {
    var data = await SQLHelper.pegaMetas();
    setState(() {
      _lista = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _atualizaMetas();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300], // Gray background color
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Proximas Metas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _lista.length,
                itemBuilder: (context, index) {
                  final item = _lista[index];
                  return GestureDetector(
                      onDoubleTap: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const EditarMeta(),
                                    settings: RouteSettings(
                                        arguments: _lista[index])))
                            .then((value) {
                          _atualizaMetas();
                        });
                      },
                      onLongPress: () {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: const Text(
                                      "Gostaria de deletar essa meta?"),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Voltar')),
                                    TextButton(
                                        onPressed: () {
                                          print("delete");
                                          SQLHelper.apagaMeta(
                                              _lista[index]['id']);
                                          _atualizaMetas();
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Deletar')),
                                  ],
                                ));
                      },
                      child: Card(
                        margin: const EdgeInsets.all(8.0),
                        child: ExpansionTile(
                          trailing: Icon(
                              IconData(item['icone'],
                                  fontFamily: 'MaterialIcons'),
                              size: 40),
                          title: Text(item['nome'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(item['data']),
                          children: <Widget>[
                            ListTile(
                              title: Text(item['descricao']),
                            )
                          ],
                        ),
                      ));
                }),
          )
        ],
      ),
    );
  }
}
