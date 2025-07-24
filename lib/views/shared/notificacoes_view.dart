import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class NotificacoesView extends StatelessWidget {
  const NotificacoesView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final notificacoes = [
      {'mensagem': 'Documento aprovado!', 'data': '21/07/2025'},
      {'mensagem': 'Visita agendada para 20/08/2025.', 'data': '20/07/2025'},
    ];
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text('Notificações'),
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
              width: isWide ? 400 : double.infinity,
              padding: const EdgeInsets.all(AppSpaces.padding),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications,
                          color: colorScheme.primary,
                          size: 32,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Notificações',
                          style: textTheme.titleLarge?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpaces.gap * 2),
                    ...notificacoes.map(
                      (n) => Card(
                        elevation: 2,
                        color: Theme.of(context).cardColor,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: Icon(
                            Icons.notifications_active,
                            color: colorScheme.secondary,
                          ),
                          title: Text(
                            n['mensagem']!,
                            style: textTheme.bodyLarge,
                          ),
                          subtitle: Text(
                            n['data']!,
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
