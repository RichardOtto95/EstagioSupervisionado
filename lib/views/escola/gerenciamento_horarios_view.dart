import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class GerenciamentoHorariosView extends StatefulWidget {
  const GerenciamentoHorariosView({super.key});

  @override
  State<GerenciamentoHorariosView> createState() =>
      _GerenciamentoHorariosViewState();
}

class _GerenciamentoHorariosViewState extends State<GerenciamentoHorariosView> {
  final List<Map<String, dynamic>> horarios = [
    {
      'horario': '08:00 - 10:00',
      'dias': ['Seg', 'Qua', 'Sex'],
    },
    {
      'horario': '14:00 - 16:00',
      'dias': ['Ter', 'Qui'],
    },
  ];
  final TextEditingController _controller = TextEditingController();
  final List<String> diasSemana = ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'];
  List<String> diasSelecionados = [];

  void _adicionarHorario() {
    if (_controller.text.isNotEmpty && diasSelecionados.isNotEmpty) {
      setState(() {
        horarios.add({
          'horario': _controller.text,
          'dias': List<String>.from(diasSelecionados),
        });
        _controller.clear();
        diasSelecionados = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text('Gerenciamento de Horários'),
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
                          Icons.schedule,
                          color: colorScheme.primary,
                          size: 32,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Gerenciar Horários',
                          style: textTheme.titleLarge?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpaces.gap * 2),
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: 'Novo horário (ex: 10:00 - 12:00)',
                        prefixIcon: Icon(
                          Icons.access_time,
                          color: colorScheme.primary,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSpaces.radius),
                        ),
                      ),
                      style: textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: diasSemana
                          .map(
                            (dia) => FilterChip(
                              label: Text(dia),
                              selected: diasSelecionados.contains(dia),
                              onSelected: (selected) {
                                setState(() {
                                  if (selected) {
                                    diasSelecionados.add(dia);
                                  } else {
                                    diasSelecionados.remove(dia);
                                  }
                                });
                              },
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.secondary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSpaces.radius),
                        ),
                      ),
                      icon: const Icon(Icons.add, color: Colors.white),
                      label: Text(
                        'Adicionar Horário',
                        style: textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _adicionarHorario,
                    ),
                    const SizedBox(height: AppSpaces.gap * 2),
                    ...horarios.map(
                      (h) => Card(
                        elevation: 2,
                        color: Theme.of(context).cardColor,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: Icon(
                            Icons.access_time,
                            color: colorScheme.primary,
                          ),
                          title: Text(h['horario'], style: textTheme.bodyLarge),
                          subtitle: Text(
                            'Dias: ${h['dias'].join(', ')}',
                            style: textTheme.bodyMedium,
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: colorScheme.error),
                            onPressed: () {
                              setState(() {
                                horarios.remove(h);
                              });
                            },
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
