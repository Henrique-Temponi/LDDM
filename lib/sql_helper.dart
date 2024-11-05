import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

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
      String nome, String descricao, String data, int icone) async {
    final db = await SQLHelper.db();

    final dados = {
      'nome': nome,
      'descricao': descricao,
      'data': data,
      'icone': icone
    };
    final id = await db.insert('metas', dados,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> pegaMetas() async {
    final db = await SQLHelper.db();
    return db.query('metas', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> pegaUmProduto(int id) async {
    final db = await SQLHelper.db();
    return db.query('produtos', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> atualizaProduto(
      int id, String nome, double valor, int ean, int qte) async {
    final db = await SQLHelper.db();

    final dados = {
      'nome': nome,
      'valor': valor,
      'ean': ean,
      'qte': qte,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('produtos', dados, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> apagaProduto(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("produtos", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Erro ao apagar o item item: $err");
    }
  }

  static Future<void> deletarTabelas() async {
    final db = await SQLHelper.db();
    int changes = await db.rawDelete("DELETE FROM metas");
  }
}
