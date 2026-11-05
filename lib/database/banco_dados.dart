
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BancoDados {
  static Database? _banco;

  static Future<Database> abrirBanco() async {
    if (_banco != null) {
      return _banco!;
    }

    final caminho = join(
      await getDatabasesPath(),
      'rotina_estudos.db',
    );

    _banco = await openDatabase(
      caminho,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tarefas (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            concluida INTEGER NOT NULL DEFAULT 0
          )
        ''');
      },
    );

    return _banco!;
  }
}
