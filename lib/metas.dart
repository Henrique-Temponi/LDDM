import 'package:flutter/material.dart';
import 'CustomMetaListItem.dart';

class Meta extends StatefulWidget {
  const Meta({super.key});

  @override
  _MetaState createState() => _MetaState();
}

class _MetaState extends State<Meta> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        width: 600,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: const <CustomMetaListItem>[
            CustomMetaListItem(
                titulo: "Estudar Geografia",
                descricao:
                    "Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem ",
                data: "10/10/204",
                iconBody: Icons.remove_red_eye),
            CustomMetaListItem(
                titulo: "Estudar Geografia",
                descricao:
                    "Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem ",
                data: "10/10/204",
                iconBody: Icons.remove_red_eye)
          ],
        ));
  }
}
