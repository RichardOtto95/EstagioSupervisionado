import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class AprovacaoDocumentosView extends StatelessWidget {
  const AprovacaoDocumentosView({super.key});

  @override
  Widget build(BuildContext context) {
    final documentosPendentes = [
      {'aluno': 'Alice', 'tipo': 'TCE'},
      {'aluno': 'Alice', 'tipo': 'FIAE'},
    ];
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Aprovação/Recusa de Documentos'),
        backgroundColor: AppColors.primary,
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
                          Icons.check_circle_outline,
                          color: AppColors.primary,
                          size: 32,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Aprovação de Documentos',
                          style: AppTextStyles.title,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpaces.gap * 2),
                    ...documentosPendentes.map(
                      (doc) => Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: const Icon(
                            Icons.description_outlined,
                            color: AppColors.secondary,
                          ),
                          title: Text('${doc['tipo']} - ${doc['aluno']}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.check,
                                  color: AppColors.success,
                                ),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Documento aprovado (mock)!',
                                      ),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: AppColors.error,
                                ),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Documento recusado (mock)!',
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
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
