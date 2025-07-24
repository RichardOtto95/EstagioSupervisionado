class Professor {
  final int id;
  final String nome;
  final String email;
  final String siape;
  final String telefone;
  final List<int> alunosIds;

  Professor({
    required this.id,
    required this.nome,
    required this.email,
    required this.siape,
    required this.telefone,
    required this.alunosIds,
  });
}
