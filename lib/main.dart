import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lddm/cadastro.dart';
import 'package:lddm/global/global_values.dart';
import 'package:lddm/home.dart';
import 'package:lddm/metas.dart';
import 'package:lddm/pomodoro.dart';
import 'package:lddm/sql_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'adicionar_meta.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // sqfliteFfiInit();
  // databaseFactory = databaseFactoryFfi;

  var path = '/my/db/path';
  if (kIsWeb) {
    // Change default factory on the web
    databaseFactory = databaseFactoryFfiWeb;
    path = 'my_web_web.db';
  }

  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const InicioApp());
}

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
    AdicionarMeta(),
    // Pomodoro(),
    Cadastro(),
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
          // title: const Center(child: Text("WorthStudy")),
          title: const Text("WorthStudy"),
          backgroundColor: GlobalValues.corHeaderPrincipal,
          shadowColor: Theme.of(context).colorScheme.shadow,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                  leading: const Icon(Icons.data_array),
                  title: const Text("Deletar banco de dados"),
                  onTap: () => SQLHelper.deletarTabelas()),
              ListTile(
                  leading: const Icon(Icons.data_array),
                  title: const Text("Sincronizar dados"),
                  onTap: () => SQLHelper.sincronizarDadosFirebase())
            ],
          ),
        ),
        body: _telas[_index],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
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
                    backgroundColor: GlobalValues.corBottomNavHome),
                BottomNavigationBarItem(
                    icon: Icon(Icons.track_changes),
                    label: "Metas",
                    backgroundColor: GlobalValues.corBottomNavMetas),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_circle),
                    label: "Adicionar Meta",
                    backgroundColor: GlobalValues.corBottomNavAddMeta),
                BottomNavigationBarItem(
                    icon: Icon(Icons.schedule),
                    label: "Pomodoro",
                    backgroundColor: GlobalValues.corBottomNavPomodoro),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "Perfil",
                    backgroundColor: GlobalValues.corBottomNavPerfil)
              ],
            ),
          ),
        ));
  }
}
