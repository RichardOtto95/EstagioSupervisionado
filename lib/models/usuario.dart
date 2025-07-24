enum TipoUsuario { aluno, professor, escola }

class Usuario {
  final int id;
  final String nome;
  final String email;
  final TipoUsuario tipo;

  Usuario({
    required this.id,
    required this.nome,
    required this.email,
    required this.tipo,
  });
}
