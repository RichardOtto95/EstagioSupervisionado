enum TipoDocumento { tce, fiae, fichaCadastral, planoAtividades }

enum StatusDocumento { pendente, enviado, aprovado, recusado }

class Documento {
  final int id;
  final TipoDocumento tipo;
  final String urlArquivo;
  final StatusDocumento status;
  final DateTime dataEnvio;
  final int alunoId;

  Documento({
    required this.id,
    required this.tipo,
    required this.urlArquivo,
    required this.status,
    required this.dataEnvio,
    required this.alunoId,
  });
}
