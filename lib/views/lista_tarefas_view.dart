import 'package:flutter/material.dart';

import '../controllers/tarefa_controller.dart';
import '../models/tarefa.dart';

class ListaTarefasView extends StatefulWidget {
  const ListaTarefasView({super.key});

  @override
  State<ListaTarefasView> createState() => _ListaTarefasViewState();
}

class _ListaTarefasViewState extends State<ListaTarefasView> {
  final TarefaController controller = TarefaController();

  List<Tarefa> tarefas = [];

  @override
  void initState() {
    super.initState();
    carregarTarefas();
  }

  Future<void> carregarTarefas() async {
    final resultado = await controller.listarTarefas();

    if (!mounted) return;

    setState(() {
      tarefas = resultado.where((tarefa) => !tarefa.concluida).toList();
    });
  }

  Future<void> concluirTarefa(Tarefa tarefa) async {
    await controller.concluirTarefa(tarefa);
    await carregarTarefas();
  }

  Future<void> excluirTarefa(int id) async {
    await controller.excluirTarefa(id);
    await carregarTarefas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas tarefas'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: tarefas.isEmpty
          ? const Center(child: Text('Nenhuma tarefa pendente.'))
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: tarefas.length,

              itemBuilder: (context, index) {
                final tarefa = tarefas[index];

                return Card(
                  child: ListTile(
                    leading: Checkbox(
                      value: tarefa.concluida,
                      onChanged: (valor) {
                        concluirTarefa(tarefa);
                      },
                    ),

                    title: Text(tarefa.nome),

                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        excluirTarefa(tarefa.id!);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
