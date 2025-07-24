import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'package:provider/provider.dart';
import '../../main.dart';

class AlunoHomeView extends StatelessWidget {
  const AlunoHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Home do Aluno'),
        backgroundColor: colorScheme.primary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sair',
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Bem-vindo, Aluno!',
                    style: textTheme.titleLarge?.copyWith(
                      color: colorScheme.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpaces.gap * 2),
                  _HomeButton(
                    icon: Icons.upload_file,
                    label: 'Upload/Assinatura de Documentos',
                    color: colorScheme.primary,
                    onTap: () =>
                        Navigator.pushNamed(context, '/upload-documento'),
                  ),
                  _HomeButton(
                    icon: Icons.event_available,
                    label: 'Agendamento de Visitas',
                    color: colorScheme.secondary,
                    onTap: () =>
                        Navigator.pushNamed(context, '/agendamento-visita'),
                  ),
                  _HomeButton(
                    icon: Icons.history,
                    label: 'Histórico de Atividades/Documentos',
                    color: colorScheme.primary,
                    onTap: () =>
                        Navigator.pushNamed(context, '/historico-atividades'),
                  ),
                  _HomeButton(
                    icon: Icons.notifications,
                    label: 'Notificações',
                    color: colorScheme.secondary,
                    onTap: () => Navigator.pushNamed(context, '/notificacoes'),
                  ),
                  _HomeButton(
                    icon: Icons.person_add_alt,
                    label: 'Cadastro de Aluno',
                    color: colorScheme.primary,
                    onTap: () =>
                        Navigator.pushNamed(context, '/cadastro-aluno'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _HomeButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpaces.radius),
            ),
            elevation: 4,
          ),
          icon: Icon(icon, color: Colors.white, size: 28),
          label: Text(
            label,
            style: textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
