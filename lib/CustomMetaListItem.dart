import 'package:flutter/material.dart';

class CustomMetaListItem extends StatelessWidget {
  const CustomMetaListItem({
    super.key,
    required this.titulo,
    required this.descricao,
    required this.data,
    required this.iconBody,
  });

  final String titulo;
  final String descricao;
  final String data;
  final IconData iconBody;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
          color: Colors.green[200]),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      width: 200,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(titulo),
                ),
                Text(data),
                Icon(iconBody)
              ],
            ),
          ),
          Expanded(child: Text(descricao))
        ],
      ),
    );
  }
}
