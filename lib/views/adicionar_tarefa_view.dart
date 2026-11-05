import 'package:flutter/material.dart';

import '../controllers/tarefa_controller.dart';

class AdicionarTarefaView extends StatefulWidget {
  const AdicionarTarefaView({super.key});

  @override
  State<AdicionarTarefaView> createState() => _AdicionarTarefaViewState();
}

class _AdicionarTarefaViewState extends State<AdicionarTarefaView> {
  final TextEditingController nomeController = TextEditingController();

  final TarefaController controller = TarefaController();

  Future<void> salvarTarefa() async {
    final nome = nomeController.text.trim();

    if (nome.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Informe o nome da tarefa!')),
      );
      return;
    }

    await controller.adicionarTarefa(nome);

    if (!mounted) return;

    Navigator.pop(context, true);
  }

  @override
  void dispose() {
    nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar tarefa'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nova tarefa',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome da tarefa',
                hintText: 'Ex: Estudar Flutter',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: salvarTarefa,
                child: const Text('Salvar tarefa'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
