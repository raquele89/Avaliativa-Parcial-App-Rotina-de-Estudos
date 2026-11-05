class Tarefa {
  final int? id;
  final String nome;
  final bool concluida;

  Tarefa({this.id, required this.nome, this.concluida = false});

  Map<String, dynamic> toMap() {
    return {'id': id, 'nome': nome, 'concluida': concluida ? 1 : 0};
  }

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      id: map['id'],
      nome: map['nome'],
      concluida: map['concluida'] == 1,
    );
  }
}
