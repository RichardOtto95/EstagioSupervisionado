import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class AtualizacaoCadastralView extends StatelessWidget {
  const AtualizacaoCadastralView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text('Atualização de Dados Cadastrais'),
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
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit_location_alt,
                          color: colorScheme.primary,
                          size: 32,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Atualizar Dados',
                          style: textTheme.titleLarge?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpaces.gap * 2),
                    _CadastroField(
                      label: 'Nome da Escola',
                      icon: Icons.business_outlined,
                    ),
                    _CadastroField(
                      label: 'Endereço',
                      icon: Icons.location_on_outlined,
                    ),
                    _CadastroField(
                      label: 'Telefone',
                      icon: Icons.phone_outlined,
                    ),
                    const SizedBox(height: AppSpaces.gap * 2),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppSpaces.radius,
                            ),
                          ),
                        ),
                        icon: const Icon(Icons.save, color: Colors.white),
                        label: Text(
                          'Salvar',
                          style: textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Dados atualizados (mock)!'),
                            ),
                          );
                        },
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

class _CadastroField extends StatelessWidget {
  final String label;
  final IconData icon;
  const _CadastroField({required this.label, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: colorScheme.primary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSpaces.radius),
          ),
        ),
        style: textTheme.bodyLarge,
      ),
    );
  }
}
