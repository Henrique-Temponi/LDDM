import 'package:flutter/material.dart';
import 'CustomMetaListItem.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text("Bem vindo de volta"),
        SizedBox(
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
                  iconBody: Icons.remove_red_eye),
              CustomMetaListItem(
                  titulo: "Estudar Geografia",
                  descricao:
                      "Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem ",
                  data: "10/10/204",
                  iconBody: Icons.remove_red_eye),
              CustomMetaListItem(
                  titulo: "Estudar Geografia",
                  descricao:
                      "Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem ",
                  data: "10/10/204",
                  iconBody: Icons.remove_red_eye),
            ],
          ),
        )
      ],
    );
  }
}
