import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class HistoricoAtividadesView extends StatelessWidget {
  const HistoricoAtividadesView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final documentos = [
      {'tipo': 'TCE', 'status': 'Aprovado'},
      {'tipo': 'FIAE', 'status': 'Pendente'},
    ];
    final visitas = [
      {
        'escola': 'Colégio Exemplo',
        'data': '10/08/2025',
        'status': 'Realizada',
      },
      {'escola': 'Colégio Exemplo', 'data': '20/08/2025', 'status': 'Agendada'},
    ];
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text('Histórico de Atividades/Documentos'),
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
                          Icons.history,
                          color: colorScheme.primary,
                          size: 32,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Histórico',
                          style: textTheme.titleLarge?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpaces.gap * 2),
                    const Text(
                      'Documentos Enviados',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ...documentos.map(
                      (doc) => Card(
                        elevation: 2,
                        color: Theme.of(context).cardColor,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: Icon(
                            Icons.description_outlined,
                            color: colorScheme.primary,
                          ),
                          title: Text(doc['tipo']!, style: textTheme.bodyLarge),
                          subtitle: Text(
                            'Status: ${doc['status']}',
                            style: textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpaces.gap * 2),
                    const Text(
                      'Visitas Realizadas',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ...visitas.map(
                      (visita) => Card(
                        elevation: 2,
                        color: Theme.of(context).cardColor,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: Icon(
                            Icons.event_available,
                            color: colorScheme.secondary,
                          ),
                          title: Text(
                            visita['escola']!,
                            style: textTheme.bodyLarge,
                          ),
                          subtitle: Text(
                            'Data: ${visita['data']} - Status: ${visita['status']}',
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
