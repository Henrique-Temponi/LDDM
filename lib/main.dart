import 'package:flutter/material.dart';

void main() => runApp(const InicioApp());

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
    Text("Home"),
    Text("metas"),
    Text("Cadastro"),
    Text("Sobre"),
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
        title: const Text("WorthStudy"),
      ),
      body: _telas[_index],
      bottomNavigationBar: BottomNavigationBar(
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
              icon: Icon(Icons.network_check),
              label: "Metas",
              backgroundColor: Color.fromARGB(255, 212, 39, 8)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Cadastro",
              backgroundColor: Color.fromARGB(255, 35, 156, 5)),
          BottomNavigationBarItem(
              icon: Icon(Icons.report),
              label: "Sobre",
              backgroundColor: Color.fromARGB(255, 6, 50, 194))
        ],
      ),
    );
  }
}
