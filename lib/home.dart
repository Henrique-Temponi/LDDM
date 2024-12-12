import 'package:flutter/material.dart';
import 'package:lddm/editar_meta.dart';
import 'package:lddm/sql_helper.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> _list = [];

  bool verificarDataRange(int dataAtual, int dataInicioSemana) {
    var resultado = false;
    var _list = List.generate(7, (i) => i + dataInicioSemana);

    for (var e in _list) {
      if (e == dataAtual) {
        resultado = true;
      }
    }

    return resultado;
  }

  void _atualizaMetas() async {
    var data = await SQLHelper.pegaMetas();

    print("is empty");
    print(data);

    // if (data.isEmpty) {
    //   data = await SQLHelper.pegarMetasFirebase();
    // }

    var semanaAtual = DateTime.now().day - DateTime.now().weekday + 1;

    //pegar o dia atual e subtrair pelo o numero de dias apartir da segunda.

    List<Map<String, dynamic>> aux = [];
    List<String> auxMonth = [];

    if (data.isEmpty) return;

    for (var meta in data) {
      auxMonth = meta['data'].split("/");
      if (auxMonth[1] == '${DateTime.now().month}' &&
          verificarDataRange(int.parse(auxMonth[0]), semanaAtual)) {
        aux.add(meta);
      }
    }

    setState(() {
      _list = aux;
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
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Bem-vindo de volta!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Voce tem ${_list.length} tarfas para esta semana',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          Expanded(
            child: ListView.builder(
              itemCount: _list.length,
              itemBuilder: (context, index) {
                final item = _list[index];
                return GestureDetector(
                  onDoubleTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditarMeta(),
                                settings:
                                    RouteSettings(arguments: _list[index])))
                        .then((value) {
                      _atualizaMetas();
                    });
                  },
                  onLongPress: () {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title:
                                  const Text("Gostaria de deletar essa meta?"),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Voltar')),
                                TextButton(
                                    onPressed: () {
                                      print("delete");
                                      SQLHelper.apagaMeta(_list[index]['id']);
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
                          IconData(item['icone'], fontFamily: 'MaterialIcons'),
                          size: 40),
                      title: Text(item['nome'],
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(item['data']),
                      children: <Widget>[
                        ListTile(
                          title: Text(item['descricao']),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
