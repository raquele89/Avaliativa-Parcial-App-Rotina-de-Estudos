import '../database/banco_dados.dart';
import '../models/tarefa.dart';

class TarefaController {

  // Cadastrar tarefa
  Future<void> adicionarTarefa(String nome) async {
    final banco = await BancoDados.abrirBanco();

    final tarefa = Tarefa(nome: nome);

    await banco.insert(
      'tarefas',
      tarefa.toMap(),
    );
  }

  // Consultar tarefas
  Future<List<Tarefa>> listarTarefas() async {
    final banco = await BancoDados.abrirBanco();

    final resultado = await banco.query('tarefas');

    return resultado.map((map) {
      return Tarefa.fromMap(map);
    }).toList();
  }

  // Concluir tarefa
  Future<void> concluirTarefa(Tarefa tarefa) async {
    final banco = await BancoDados.abrirBanco();

    await banco.update(
      'tarefas',
      {'concluida': tarefa.concluida ? 0 : 1},
      where: 'id = ?',
      whereArgs: [tarefa.id],
    );
  }

  // Excluir tarefa
  Future<void> excluirTarefa(int id) async {
    final banco = await BancoDados.abrirBanco();

    await banco.delete(
      'tarefas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
