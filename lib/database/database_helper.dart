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
  }

  // ==========================
  // INSERIR USUÁRIO
  // ==========================
  Future<int> inserirUsuario(Map<String, dynamic> usuario) async {
    final db = await database;

    return await db.insert(
      'usuarios',
      usuario,
    );
  }

  // ==========================
  // INSERIR INSTITUIÇÃO
  // ==========================
  Future<int> inserirInstituicao(
      Map<String, dynamic> instituicao) async {
    final db = await database;

    return await db.insert(
      'instituicoes',
      instituicao,
    );
  }

  // ==========================
  // LISTAR INSTITUIÇÕES
  // ==========================
  Future<List<Map<String, dynamic>>> listarInstituicoes() async {
    final db = await database;

    return await db.query('instituicoes');
  }

  // ==========================
  // LISTAR USUÁRIOS
  // ==========================
  Future<List<Map<String, dynamic>>> listarUsuarios() async {
    final db = await database;

    return await db.query('usuarios');
  }
}