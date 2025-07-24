class Aluno {
  final int id;
  final String nome;
  final String email;
  final String matricula;
  final String curso;
  final String telefone;
  final List<int> documentosIds;
  final List<int> visitasIds;

  Aluno({
    required this.id,
    required this.nome,
    required this.email,
    required this.matricula,
    required this.curso,
    required this.telefone,
    required this.documentosIds,
    required this.visitasIds,
  });
}
