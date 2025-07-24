enum StatusVisita { agendada, realizada, confirmada, reagendada }

class Visita {
  final int id;
  final int alunoId;
  final int escolaId;
  final DateTime data;
  final StatusVisita status;

  Visita({
    required this.id,
    required this.alunoId,
    required this.escolaId,
    required this.data,
    required this.status,
  });
}
