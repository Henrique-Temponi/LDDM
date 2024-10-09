import 'package:flutter/material.dart';
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
      icon: Icons.abc,
      description: 'Description for Event 1.',
    ),
    CardItem(
      title: 'Event 2',
      date: '2024-10-09',
      icon: Icons.event,
      description: 'Description for Event 2.',
    ),
    CardItem(
      title: 'Event 3',
      date: '2024-10-10',
      icon: Icons.event,
      description: 'Description for Event 3.',
    ),
    CardItem(
      title: 'Event 3',
      date: '2024-10-10',
      icon: Icons.event,
      description: 'Description for Event 3.',
    ),
    CardItem(
      title: 'Event 3',
      date: '2024-10-10',
      icon: Icons.event,
      description: 'Description for Event 3.',
    ),
    CardItem(
      title: 'Event 3',
      date: '2024-10-10',
      icon: Icons.event,
      description: 'Description for Event 3.',
    ),
    CardItem(
      title: 'Event 3',
      date: '2024-10-10',
      icon: Icons.event,
      description: 'Description for Event 3.',
    ),
    CardItem(
      title: 'Event 3',
      date: '2024-10-10',
      icon: Icons.event,
      description: 'Description for Event 3.',
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
                return Card(
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
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
