import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class VisualizacaoAgendamentosView extends StatelessWidget {
  const VisualizacaoAgendamentosView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final agendamentos = [
      {
        'aluno': 'Alice',
        'escola': 'Colégio Exemplo',
        'data': '20/08/2025',
        'status': 'Agendada',
      },
      {
        'aluno': 'Alice',
        'escola': 'Colégio Exemplo',
        'data': '10/08/2025',
        'status': 'Realizada',
      },
    ];
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text('Visualização de Agendamentos'),
        backgroundColor: colorScheme.primary,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 600;
          return Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: isWide ? 500 : double.infinity,
              padding: const EdgeInsets.all(AppSpaces.padding),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: colorScheme.primary,
                          size: 32,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Agendamentos',
                          style: textTheme.titleLarge?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpaces.gap * 2),
                    ...agendamentos.map(
                      (ag) => Card(
                        elevation: 2,
                        color: Theme.of(context).cardColor,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: Icon(
                            Icons.event_available,
                            color: colorScheme.secondary,
                          ),
                          title: Text(
                            '${ag['aluno']} - ${ag['escola']}',
                            style: textTheme.bodyLarge,
                          ),
                          subtitle: Text(
                            'Data: ${ag['data']} - Status: ${ag['status']}',
                            style: textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
