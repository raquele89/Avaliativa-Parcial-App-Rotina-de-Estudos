import 'package:flutter/material.dart';

import '../controllers/tarefa_controller.dart';
import '../models/tarefa.dart';

class ConcluidasView extends StatefulWidget {
  const ConcluidasView({super.key});

  @override
  State<ConcluidasView> createState() => _ConcluidasViewState();
}

class _ConcluidasViewState extends State<ConcluidasView> {
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
      tarefas = resultado.where((tarefa) => tarefa.concluida).toList();
    });
  }

  Future<void> reabrirTarefa(Tarefa tarefa) async {
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
        title: const Text('Tarefas concluídas'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: tarefas.isEmpty
          ? const Center(child: Text('Nenhuma tarefa concluída.'))
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: tarefas.length,

              itemBuilder: (context, index) {
                final tarefa = tarefas[index];

                return Card(
                  child: ListTile(
                    leading: Checkbox(
                      value: true,
                      onChanged: (valor) {
                        reabrirTarefa(tarefa);
                      },
                    ),

                    title: Text(
                      tarefa.nome,
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),

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
