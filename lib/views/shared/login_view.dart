import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/usuario.dart';
import '../../../main.dart';
import '../../utils/constants.dart';

// Mock de usuários
final List<Usuario> mockUsuarios = [
  Usuario(
    id: 1,
    nome: 'Alice',
    email: 'alice@aluno.com',
    tipo: TipoUsuario.aluno,
  ),
  Usuario(
    id: 2,
    nome: 'Bruno',
    email: 'bruno@prof.com',
    tipo: TipoUsuario.professor,
  ),
  Usuario(
    id: 3,
    nome: 'Colégio Exemplo',
    email: 'contato@escola.com',
    tipo: TipoUsuario.escola,
  ),
];

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _senha;
  TipoUsuario? _perfilSelecionado;
  String? _erro;
  bool _loading = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _loginGovBr() async {
    if (_perfilSelecionado == null) {
      setState(() {
        _erro = 'Selecione o perfil para login com Gov.br.';
      });
      return;
    }
    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 1));
    Provider.of<AuthProvider>(context, listen: false).login('Usuário Gov.br');
    if (_perfilSelecionado == TipoUsuario.aluno) {
      Navigator.pushReplacementNamed(context, '/aluno');
    } else if (_perfilSelecionado == TipoUsuario.professor) {
      Navigator.pushReplacementNamed(context, '/professor');
    } else if (_perfilSelecionado == TipoUsuario.escola) {
      Navigator.pushReplacementNamed(context, '/escola');
    }
    setState(() => _loading = false);
  }

  void _login() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _loading = true;
      _erro = null;
    });
    await Future.delayed(const Duration(milliseconds: 500));
    final usuario = mockUsuarios.firstWhere(
      (u) => u.email == _email && u.tipo == _perfilSelecionado,
      orElse: () =>
          Usuario(id: -1, nome: '', email: '', tipo: TipoUsuario.aluno),
    );
    if (usuario.id != -1) {
      Provider.of<AuthProvider>(context, listen: false).login(usuario.nome);
      if (usuario.tipo == TipoUsuario.aluno) {
        Navigator.pushReplacementNamed(context, '/aluno');
      } else if (usuario.tipo == TipoUsuario.professor) {
        Navigator.pushReplacementNamed(context, '/professor');
      } else if (usuario.tipo == TipoUsuario.escola) {
        Navigator.pushReplacementNamed(context, '/escola');
      }
    } else {
      setState(() {
        _erro = 'Usuário ou perfil inválido.';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final cardColor = Theme.of(context).cardColor;
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 600;
          return Center(
            child: FadeTransition(
              opacity: _fadeAnim,
              child: Card(
                elevation: 8,
                color: cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpaces.radius),
                ),
                child: Container(
                  width: isWide ? 400 : double.infinity,
                  padding: const EdgeInsets.all(AppSpaces.padding),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.school,
                              color: colorScheme.primary,
                              size: 36,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Login',
                              style: textTheme.titleLarge?.copyWith(
                                color: colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpaces.gap * 2),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: colorScheme.primary,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                AppSpaces.radius,
                              ),
                            ),
                          ),
                          style: textTheme.bodyLarge,
                          keyboardType: TextInputType.emailAddress,
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return 'Informe o e-mail';
                            }
                            final emailRegex = RegExp(
                              r'^[\w-.]+@[\w-]+\.[a-zA-Z]{2,}\$',
                            );
                            if (!emailRegex.hasMatch(v)) {
                              return 'E-mail inválido';
                            }
                            return null;
                          },
                          onChanged: (v) => _email = v,
                        ),
                        const SizedBox(height: AppSpaces.gap),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: colorScheme.primary,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                AppSpaces.radius,
                              ),
                            ),
                          ),
                          style: textTheme.bodyLarge,
                          obscureText: true,
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return 'Informe a senha';
                            }
                            if (v.length < 4) return 'Senha muito curta';
                            return null;
                          },
                          onChanged: (v) => _senha = v,
                        ),
                        const SizedBox(height: AppSpaces.gap),
                        DropdownButtonFormField<TipoUsuario>(
                          value: _perfilSelecionado,
                          hint: const Text('Selecione o perfil'),
                          isExpanded: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                AppSpaces.radius,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: colorScheme.primary,
                            ),
                          ),
                          style: textTheme.bodyLarge,
                          dropdownColor: cardColor,
                          validator: (v) =>
                              v == null ? 'Selecione o perfil' : null,
                          items: TipoUsuario.values.map((tipo) {
                            return DropdownMenuItem(
                              value: tipo,
                              child: Text(
                                tipo.name[0].toUpperCase() +
                                    tipo.name.substring(1),
                                style: textTheme.bodyLarge,
                              ),
                            );
                          }).toList(),
                          onChanged: (tipo) =>
                              setState(() => _perfilSelecionado = tipo),
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
                            icon: _loading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : const Icon(Icons.login, color: Colors.white),
                            label: Text(
                              'Entrar',
                              style: textTheme.bodyLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: _loading ? null : _login,
                          ),
                        ),
                        const SizedBox(height: AppSpaces.gap),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.secondary,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppSpaces.radius,
                              ),
                            ),
                          ),
                          icon: const Icon(
                            Icons.verified_user,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Entrar com Gov.br',
                            style: textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: _loading ? null : _loginGovBr,
                        ),
                        if (_erro != null) ...[
                          const SizedBox(height: AppSpaces.gap),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error_outline,
                                color: colorScheme.error,
                                size: 20,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                _erro!,
                                style: textTheme.bodyLarge?.copyWith(
                                  color: colorScheme.error,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
