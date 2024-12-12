import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:lddm/global/global_values.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> criaTabela(sql.Database database) async {
    await database.execute("""CREATE TABLE metas (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nome TEXT,
        descricao TEXT,
        data TEXT,
        icone INT DEFAULT 0,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'metas.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await criaTabela(database);
      },
    );
  }

  static Future<int> adicionarMeta(
      String nome, String descricao, String data, int icone,
      {bool addInFirebase = false}) async {
    final db = await SQLHelper.db();

    final dados = {
      'nome': nome,
      'descricao': descricao,
      'data': data,
      'icone': icone
    };

    final id = await db.insert('metas', dados,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    if (addInFirebase) {
      FirebaseFirestore.instance.collection('metas').add({
        'data': data,
        'descricao': descricao,
        'nome': nome,
        'id': id,
      });
    }

    return id;
  }

  static Future<List<Map<String, dynamic>>> pegaMetas() async {
    final db = await SQLHelper.db();
    return db.query('metas', orderBy: "id");
  }

  // static Future<List<Map<String, dynamic>>> pegarMetasPorMes(
  //     String month) async {
  //   var metas = await pegaMetas();
  //   Future<List<Map<String, dynamic>>> aux = ;

  //   for (var meta in metas) {
  //     String auxmonth = meta['data'].split('/');
  //     if (auxmonth == month) {aux.add(meta);}
  //   }
  // }

  static Future<List<Map<String, dynamic>>> pegaUmProduto(int id) async {
    final db = await SQLHelper.db();
    return db.query('produtos', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> atualizaMeta(
      int id, String nome, String descricao, String data, int iconData) async {
    final db = await SQLHelper.db();

    final dados = {
      'nome': nome,
      'descricao': descricao,
      'data': data,
      'icone': iconData,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('metas', dados, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> apagaMeta(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("metas", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Erro ao apagar o item item: $err");
    }
  }

  static Future<void> deletarTabelas() async {
    final db = await SQLHelper.db();
    // ignore: unused_local_variable
    int changes = await db.rawDelete("DELETE FROM metas");
  }

  static Future<List<Map<String, dynamic>>> pegarMetasFirebase() async {
    List<Map<String, dynamic>> aux = List.empty(growable: true);
    var metas = await FirebaseFirestore.instance
        .collection('metas')
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        print(element.data()['nome']);
        aux.add({
          'id': element.data()['id'],
          'nome': element.data()['nome'],
          'descricao': element.data()['descricao'],
          'data': element.data()['data'],
          'icone': 0xe51c,
        });

        adicionarMeta(element.data()['nome'], element.data()['descricao'],
            element.data()['data'], GlobalValues.iconValue,
            addInFirebase: false);
      }
    });

    return aux;
  }

  static Future<void> sincronizarDadosFirebase() async {
    List<Map<String, dynamic>> metasAtuais = await pegaMetas();
    // List<Map<String, dynamic>> metasFireBase = await pegarMetasFirebase();
    List<Map<String, dynamic>> metasFireBase = List.empty(growable: true);
    metasFireBase.add({
      'id': 1,
    });
    metasFireBase.add({
      'id': 2,
    });
    metasFireBase.add({
      'id': 3,
    });
    metasFireBase.add({
      'id': 4,
    });
    metasFireBase.add({
      'id': 5,
    });
    metasFireBase.add({
      'id': 6,
    });

    if (metasAtuais.length == metasFireBase.length) return;

    if (metasFireBase.length > metasAtuais.length) {
      for (var elementFB in metasFireBase) {
        for (var metasDB in metasAtuais) {
          if (metasDB.values.contains(elementFB['id'])) {
            print("ok");
          } else {
            print("No bueno");
          }
        }
      }
    }
  }
}
