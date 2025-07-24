import 'package:flutter/material.dart';
import '../../utils/constants.dart';

// Mock de escolas e horários disponíveis
final List<Map<String, dynamic>> escolasMock = [
  {
    'nome': 'Colégio Exemplo',
    'horarios': {
      '2025-08-20': ['08:00', '10:00', '14:00'],
      '2025-08-21': ['09:00', '13:00'],
    },
  },
  {
    'nome': 'Escola Futuro',
    'horarios': {
      '2025-08-20': ['09:00', '11:00'],
      '2025-08-22': ['08:00', '15:00'],
    },
  },
];

class AgendamentoVisitaView extends StatefulWidget {
  const AgendamentoVisitaView({super.key});

  @override
  State<AgendamentoVisitaView> createState() => _AgendamentoVisitaViewState();
}

class _AgendamentoVisitaViewState extends State<AgendamentoVisitaView> {
  int etapa = 0;
  String pesquisa = '';
  Map<String, dynamic>? escolaSelecionada;
  DateTime? dataSelecionada;
  String? horarioSelecionado;

  List<Map<String, dynamic>> get escolasFiltradas {
    if (pesquisa.isEmpty) return escolasMock;
    return escolasMock
        .where((e) => e['nome'].toLowerCase().contains(pesquisa.toLowerCase()))
        .toList();
  }

  List<String> get datasDisponiveis {
    if (escolaSelecionada == null) return [];
    return (escolaSelecionada!['horarios'] as Map<String, dynamic>).keys
        .toList();
  }

  List<String> get horariosDisponiveis {
    if (escolaSelecionada == null || dataSelecionada == null) return [];
    final dataStr =
        '${dataSelecionada!.year}-${dataSelecionada!.month.toString().padLeft(2, '0')}-${dataSelecionada!.day.toString().padLeft(2, '0')}';
    return List<String>.from(
      (escolaSelecionada!['horarios'] as Map<String, dynamic>)[dataStr] ?? [],
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text('Agendamento de Visita'),
        backgroundColor: colorScheme.primary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpaces.padding),
        child: Stepper(
          type: StepperType.vertical,
          currentStep: etapa,
          onStepContinue: () {
            if (etapa == 0 && escolaSelecionada != null) {
              setState(() => etapa = 1);
            } else if (etapa == 1 && dataSelecionada != null) {
              setState(() => etapa = 2);
            } else if (etapa == 2 && horarioSelecionado != null) {
              // Confirmar agendamento
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Visita agendada (mock)!')),
              );
              setState(() {
                etapa = 0;
                escolaSelecionada = null;
                dataSelecionada = null;
                horarioSelecionado = null;
                pesquisa = '';
              });
            }
          },
          onStepCancel: () {
            if (etapa > 0) setState(() => etapa--);
          },
          steps: [
            Step(
              title: const Text('Escolha a escola'),
              isActive: etapa == 0,
              content: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Pesquisar escola',
                      prefixIcon: Icon(
                        Icons.search,
                        color: colorScheme.primary,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSpaces.radius),
                      ),
                    ),
                    style: textTheme.bodyLarge,
                    onChanged: (v) => setState(() => pesquisa = v),
                  ),
                  const SizedBox(height: 12),
                  ...escolasFiltradas.map(
                    (e) => Card(
                      color: escolaSelecionada == e
                          ? colorScheme.primary.withOpacity(0.2)
                          : Theme.of(context).cardColor,
                      child: ListTile(
                        title: Text(e['nome'], style: textTheme.bodyLarge),
                        trailing: escolaSelecionada == e
                            ? Icon(Icons.check, color: colorScheme.primary)
                            : null,
                        onTap: () => setState(() {
                          escolaSelecionada = e;
                          dataSelecionada = null;
                          horarioSelecionado = null;
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Step(
              title: const Text('Escolha a data'),
              isActive: etapa == 1,
              content: Column(
                children: [
                  if (escolaSelecionada != null && datasDisponiveis.isNotEmpty)
                    Wrap(
                      spacing: 8,
                      children: datasDisponiveis.map((d) {
                        final dt = DateTime.parse(d);
                        final selecionada =
                            dataSelecionada != null &&
                            dataSelecionada!.year == dt.year &&
                            dataSelecionada!.month == dt.month &&
                            dataSelecionada!.day == dt.day;
                        return ChoiceChip(
                          label: Text('${dt.day}/${dt.month}/${dt.year}'),
                          selected: selecionada,
                          onSelected: (_) => setState(() {
                            dataSelecionada = dt;
                            horarioSelecionado = null;
                          }),
                        );
                      }).toList(),
                    )
                  else
                    const Text('Nenhuma data disponível para esta escola.'),
                ],
              ),
            ),
            Step(
              title: const Text('Escolha o horário'),
              isActive: etapa == 2,
              content: Column(
                children: [
                  if (horariosDisponiveis.isNotEmpty)
                    Wrap(
                      spacing: 8,
                      children: horariosDisponiveis
                          .map(
                            (h) => ChoiceChip(
                              label: Text(h),
                              selected: horarioSelecionado == h,
                              onSelected: (_) =>
                                  setState(() => horarioSelecionado = h),
                            ),
                          )
                          .toList(),
                    )
                  else
                    const Text('Nenhum horário disponível para esta data.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
