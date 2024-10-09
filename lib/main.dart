import 'package:flutter/material.dart';
import 'package:lddm/cadastro.dart';
import 'package:lddm/home.dart';
import 'package:lddm/metas.dart';
import 'package:lddm/sobre.dart';
import 'CustomMetaListItem.dart';

void main() => runApp(const InicioApp());

//test
class InicioApp extends StatelessWidget {
  const InicioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int _index = 0;
  static const List<Widget> _telas = <Widget>[
    Home(),
    Meta(),
    Cadastro(),
    Sobre(),
    Home(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("WorthStudy")),
          backgroundColor: Colors.red,
          shadowColor: Theme.of(context).colorScheme.shadow,
        ),
        body: _telas[_index],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.red,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: BottomNavigationBar(
              currentIndex: _index,
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.yellow,
              onTap: onTabTapped,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Inicio",
                    backgroundColor: Color.fromARGB(255, 208, 223, 9)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.track_changes),
                    label: "Metas",
                    backgroundColor: Color.fromARGB(255, 212, 39, 8)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_circle),
                    label: "Adicionar Meta",
                    backgroundColor: Color.fromARGB(255, 35, 156, 5)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.schedule),
                    label: "Pomodoro",
                    backgroundColor: Color.fromARGB(255, 35, 156, 5)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "Perfil",
                    backgroundColor: Color.fromARGB(255, 6, 50, 194))
              ],
            ),
          ),
        ));
  }
}
