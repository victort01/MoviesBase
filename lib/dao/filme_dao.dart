import 'package:sqflite/sqflite.dart';
import '../model/filme.dart';
import '../database/database_helper.dart';

class FilmeDAO {
  static const String tableFilmes = 'filmes';

  Future<void> inserirFilme(Filme filme) async {
    final db = await DatabaseHelper.instance.database;
    await db.insert(
      tableFilmes,
      filme.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Filme>> listarFilmes() async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(tableFilmes);
    return List.generate(
      maps.length,
      (i) => Filme.fromMap(maps[i]),
    );
  }

  Future<void> atualizarFilme(Filme filme) async {
    final db = await DatabaseHelper.instance.database;
    await db.update(
      tableFilmes,
      filme.toMap(),
      where: 'id = ?',
      whereArgs: [filme.id],
    );
  }

  Future<void> deletarFilme(int id) async {
    final db = await DatabaseHelper.instance.database;
    await db.delete(
      tableFilmes,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
