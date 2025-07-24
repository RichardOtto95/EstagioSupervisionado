import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class UploadDocumentoView extends StatefulWidget {
  const UploadDocumentoView({super.key});

  @override
  State<UploadDocumentoView> createState() => _UploadDocumentoViewState();
}

class _UploadDocumentoViewState extends State<UploadDocumentoView> {
  String? tipoSelecionado;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text('Upload/Assinatura de Documento'),
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
                          Icons.upload_file,
                          color: colorScheme.primary,
                          size: 32,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Upload/Assinatura',
                          style: textTheme.titleLarge?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpaces.gap * 2),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Tipo de Documento',
                        prefixIcon: Icon(
                          Icons.description_outlined,
                          color: colorScheme.primary,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppSpaces.radius),
                        ),
                      ),
                      style: textTheme.bodyLarge,
                      dropdownColor: Theme.of(context).cardColor,
                      items: const [
                        DropdownMenuItem(value: 'TCE', child: Text('TCE')),
                        DropdownMenuItem(value: 'FIAE', child: Text('FIAE')),
                        DropdownMenuItem(
                          value: 'Ficha Cadastral',
                          child: Text('Ficha Cadastral'),
                        ),
                        DropdownMenuItem(
                          value: 'Plano de Atividades',
                          child: Text('Plano de Atividades'),
                        ),
                      ],
                      onChanged: (v) => setState(() => tipoSelecionado = v),
                    ),
                    const SizedBox(height: AppSpaces.gap),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.secondary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSpaces.radius),
                        ),
                      ),
                      icon: const Icon(Icons.attach_file, color: Colors.white),
                      label: Text(
                        'Selecionar Arquivo (Mock)',
                        style: textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(height: AppSpaces.gap),
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
                        icon: const Icon(
                          Icons.edit_document,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Assinar e Enviar',
                          style: textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Documento assinado e enviado (mock)!',
                              ),
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
