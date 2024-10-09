import 'package:flutter/material.dart';
import 'package:lddm/editar_meta.dart';
import 'card_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<CardItem> items = [
    CardItem(
      title: 'Estudar Geografia',
      date: '2024-10-08',
      icon: Icons.remove_red_eye,
      description: 'Estudar Geografia para a prova',
    ),
    CardItem(
      title: 'Trabalho LDDM',
      date: '2024-11-09',
      icon: Icons.remove_red_eye,
      description: 'Fazer trabalho de LDDM.',
    ),
    CardItem(
      title: 'Grafos',
      date: '2024-10-1',
      icon: Icons.remove_red_eye,
      description: 'Implementar o trabalho de grafos',
    ),
    CardItem(
      title: 'Estatistica',
      date: '2024-10-31',
      icon: Icons.remove_red_eye,
      description: 'Estudar estatistica',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300], // Gray background color
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Bem-vindo de volta!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Voce tem x tarfas para esta semana',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return GestureDetector(
                  onLongPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditarMeta(),
                            settings: RouteSettings(arguments: items[index])));
                  },
                  child: Card(
                    margin: EdgeInsets.all(8.0),
                    child: ExpansionTile(
                      trailing: Icon(item.icon, size: 40),
                      title: Text(item.title,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(item.date),
                      children: <Widget>[
                        ListTile(
                          title: Text(item.description),
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
