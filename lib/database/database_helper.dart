import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('filmes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE filmes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        imagemUrl TEXT,
        titulo TEXT NOT NULL,
        genero TEXT NOT NULL,
        faixaEtaria TEXT NOT NULL,
        duracao TEXT NOT NULL,
        pontuacao REAL NOT NULL,
        descricao TEXT NOT NULL,
        ano INTEGER NOT NULL
      )
    ''');
  }

  Future close() async {
    final db = await instance.database;
    await db.close();
  }
}
