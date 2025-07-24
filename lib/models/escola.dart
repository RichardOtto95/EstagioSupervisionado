class Escola {
  final int id;
  final String nome;
  final String endereco;
  final String telefone;
  final String email;
  final List<int> visitasIds;

  Escola({
    required this.id,
    required this.nome,
    required this.endereco,
    required this.telefone,
    required this.email,
    required this.visitasIds,
  });
}
