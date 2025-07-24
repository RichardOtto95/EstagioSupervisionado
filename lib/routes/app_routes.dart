import 'package:flutter/material.dart';
import '../views/shared/login_view.dart';
import '../views/aluno/aluno_view.dart';
import '../views/professor/professor_view.dart';
import '../views/escola/escola_view.dart';
import '../views/aluno/cadastro_aluno_view.dart';
import '../views/professor/cadastro_professor_view.dart';
import '../views/escola/cadastro_escola_view.dart';
import '../views/aluno/upload_documento_view.dart';
import '../views/aluno/agendamento_visita_view.dart';
import '../views/aluno/historico_atividades_view.dart';
import '../views/professor/aprovacao_documentos_view.dart';
import '../views/professor/visualizacao_agendamentos_view.dart';
import '../views/escola/visualizacao_agendamentos_view.dart';
import '../views/shared/notificacoes_view.dart';
import '../views/escola/gerenciamento_horarios_view.dart';
import '../views/escola/atualizacao_cadastral_view.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const LoginView(),
    '/aluno': (context) => const AlunoHomeView(),
    '/professor': (context) => const ProfessorHomeView(),
    '/escola': (context) => const EscolaHomeView(),
    '/cadastro-aluno': (context) => const CadastroAlunoView(),
    '/cadastro-professor': (context) => const CadastroProfessorView(),
    '/cadastro-escola': (context) => const CadastroEscolaView(),
    '/upload-documento': (context) => const UploadDocumentoView(),
    '/agendamento-visita': (context) => const AgendamentoVisitaView(),
    '/historico-atividades': (context) => const HistoricoAtividadesView(),
    '/aprovacao-documentos': (context) => const AprovacaoDocumentosView(),
    '/visualizacao-agendamentos-professor': (context) =>
        const VisualizacaoAgendamentosView(),
    '/visualizacao-agendamentos-escola': (context) =>
        const VisualizacaoAgendamentosEscolaView(),
    '/notificacoes': (context) => const NotificacoesView(),
    '/gerenciamento-horarios': (context) => const GerenciamentoHorariosView(),
    '/atualizacao-cadastral': (context) => const AtualizacaoCadastralView(),
  };
}
