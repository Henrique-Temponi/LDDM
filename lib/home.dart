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

  void _atualizaMetas() async {
    final data = await SQLHelper.pegaMetas();
    setState(() {
      _list = data;
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
                            settings: RouteSettings(arguments: _list[index])));
                  },
                  onLongPress: () {
                    //TODO: fazer a exclusao
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
