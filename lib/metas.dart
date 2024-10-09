import 'package:flutter/material.dart';
import 'package:lddm/editar_meta.dart';
import 'card_item.dart';

class Meta extends StatefulWidget {
  const Meta({super.key});

  @override
  _MetaState createState() => _MetaState();
}

class _MetaState extends State<Meta> {
  final List<CardItem> items = [
    CardItem(
      title: 'Estudar Geografia',
      date: '2024-10-08',
      icon: Icons.remove_red_eye,
      description: 'Revisar capitais e continentes.',
    ),
    CardItem(
      title: 'Ler Capítulo de Matemática',
      date: '2024-10-09',
      icon: Icons.remove_red_eye,
      description: 'Ler o Capítulo 5 e resolver exercícios.',
    ),
    CardItem(
      title: 'Preparar Apresentação de História',
      date: '2024-10-10',
      icon: Icons.remove_red_eye,
      description: 'Preparar slides sobre a Revolução Industrial.',
    ),
    CardItem(
      title: 'Praticar Português',
      date: '2024-10-11',
      icon: Icons.remove_red_eye,
      description: 'Fazer exercícios de conjugação de verbos.',
    ),
    CardItem(
      title: 'Revisar Química',
      date: '2024-10-12',
      icon: Icons.remove_red_eye,
      description: 'Estudar ligações químicas e suas propriedades.',
    ),
    CardItem(
      title: 'Trabalhar em Projeto de Artes',
      date: '2024-10-13',
      icon: Icons.remove_red_eye,
      description: 'Criar uma obra inspirada em Van Gogh.',
    ),
    CardItem(
      title: 'Estudar Biologia',
      date: '2024-10-14',
      icon: Icons.remove_red_eye,
      description: 'Revisar sistema circulatório e suas funções.',
    ),
    CardItem(
      title: 'Praticar Física',
      date: '2024-10-15',
      icon: Icons.remove_red_eye,
      description: 'Resolver problemas de cinemática.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300], // Gray background color
      padding: EdgeInsets.all(20),
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
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return GestureDetector(
                      onLongPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditarMeta(),
                                settings:
                                    RouteSettings(arguments: items[index])));
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
                      ));
                }),
          )
        ],
      ),
    );
  }
}
