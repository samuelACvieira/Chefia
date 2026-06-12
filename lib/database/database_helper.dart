import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'chefia.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE usuarios (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        objetivo TEXT,
        qtd_pessoas INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE instituicoes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        tipo TEXT NOT NULL,
        responsavel TEXT,
        cargo TEXT,
        email TEXT,
        telefone TEXT
      )
    ''');

    // ==========================
    // TABELA ESTOQUE
    // ==========================
    await db.execute('''
      CREATE TABLE estoque (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        quantidade TEXT NOT NULL,
        tipo TEXT,
        validade TEXT
      )
    ''');
  }

  // ==========================
  // USUÁRIOS
  // ==========================
  Future<int> inserirUsuario(Map<String, dynamic> usuario) async {
    final db = await database;
    return await db.insert('usuarios', usuario);
  }

  Future<List<Map<String, dynamic>>> listarUsuarios() async {
    final db = await database;
    return await db.query('usuarios');
  }

  Future<int> deletarItemEstoque(int id) async {
  final db = await database;
  return await db.delete(
    'estoque',
    where: 'id = ?',
    whereArgs: [id],
  );
}
Future<int> atualizarItemEstoque(Map<String, dynamic> item) async {
  final db = await database;
  return await db.update(
    'estoque',
    item,
    where: 'id = ?',
    whereArgs: [item['id']],
  );
}

  // ==========================
  // INSTITUIÇÕES
  // ==========================
  Future<int> inserirInstituicao(Map<String, dynamic> instituicao) async {
    final db = await database;
    return await db.insert('instituicoes', instituicao);
  }

  Future<List<Map<String, dynamic>>> listarInstituicoes() async {
    final db = await database;
    return await db.query('instituicoes');
  }

  // ==========================
  // 🧠 ESTOQUE (PADRONIZADO)
  // ==========================

  Future<int> inserirItemEstoque(Map<String, dynamic> item) async {
    final db = await database;
    return await db.insert('estoque', item);
  }

  Future<List<Map<String, dynamic>>> listarEstoque() async {
    final db = await database;
    return await db.query('estoque', orderBy: 'id DESC');
  }
}
