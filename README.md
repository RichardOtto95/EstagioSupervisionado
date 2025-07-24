# Planejamento, Análise de Requisitos e Modelagem de Dados - Sistema de Estágio Supervisionado (Versão Atualizada)

## 1. Planejamento de Melhoria do Processo

**Objetivo:** Desenvolver uma plataforma única de estágio supervisionado, permitindo que Alunos, Professores e Escolas gerenciem digitalmente documentos, visitas e supervisão de forma segura, rastreável e ágil.

**Escopo:**

* Aplicativo multiplataforma desenvolvido 100% em Flutter (Android, iOS, Web, Desktop).
* Login individual para Aluno, Professor e Escola (simulado/local).
* Upload, preenchimento e assinatura digital de documentos.
* Gestão de visitas às escolas.
* Painéis de acompanhamento específicos para cada usuário.
* Notificações automáticas de status.
* Persistência local dos dados (ex: Hive, SQLite).

**Tecnologias:**

* Flutter (Dart) para todo o desenvolvimento.
* Persistência local: Hive, SQLite ou SharedPreferences.
* Sem backend externo/API.

## 2. Análise de Requisitos

### 2.1 Requisitos Funcionais

#### Aluno

* RF1: Login com autenticação institucional ou Gov.br.
* RF2: Upload, preenchimento e assinatura digital de documentos obrigatórios (TCE, FIAE, Ficha Cadastral, Plano de Atividades).
* RF3: Agendamento de visitas a escolas cadastradas.
* RF4: Consulta ao histórico de atividades, documentos enviados e visitas realizadas.
* RF5: Visualização do status dos documentos enviados.
* RF6: Recebimento de notificações sobre pendências e atualizações.

#### Professor

* RF7: Login próprio e seguro.
* RF8: Visualização de alunos sob sua supervisão.
* RF9: Aprovação ou recusa de documentos enviados pelos alunos.
* RF10: Visualização de agendamentos de visitas realizadas pelos alunos.
* RF11: Envio de notificações aos alunos sobre documentos e pendências.

#### Escola

* RF12: Login próprio e seguro.
* RF13: Gestão de horários disponíveis para agendamento de visitas.
* RF14: Confirmação ou reagendamento de visitas.
* RF15: Atualização de dados cadastrais e localização.
* RF16: Visualização de agendamentos realizados pelos alunos.

### 2.2 Requisitos Não Funcionais

* RNF1: Carregamento das páginas em até 3 segundos.
* RNF2: Responsividade para mobile, tablet e desktop.
* RNF3: Autenticação segura.
* RNF4: Uptime mínimo de 99% em período letivo.
* RNF5: Interface amigável e intuitiva.
* RNF6: Conformidade com a LGPD.

### 2.3 Requisitos de Restrição

* RR1: Aplicativo 100% Flutter, sem backend externo.
* RR2: Utilização de persistência local (Hive, SQLite, etc).
* RR3: Multiplataforma (Android, iOS, Web, Desktop).
* RR4: Entrega até o fim do semestre letivo de 2025.

## 3. Modelagem de Dados

A modelagem de dados considerará as entidades **Aluno, Professor, Escola, Documento, Visita, Usuário** e os fluxos de aprovação, agendamento e rastreabilidade dos processos.

* Diagrama Entidade-Relacionamento e Relacional serão gerados e vinculados a este documento para acompanhamento técnico no desenvolvimento do sistema.

## 4. Etapas Detalhadas

### 4.1 Fluxo do Aluno

1. Login.
2. Upload e preenchimento de documentos.
3. Assinatura digital.
4. Agendamento de visitas:
   - Exibir listagem de escolas com campo de pesquisa.
   - Aluno seleciona a escola desejada.
   - Após selecionar a escola, exibir seleção de data.
   - Após selecionar a data, exibir horários disponíveis para aquela data na escola escolhida.
   - Aluno seleciona o horário e confirma o agendamento.
5. Acompanhamento do status de documentos.
6. Recebimento de notificações.

### 4.2 Fluxo do Professor

1. Login.
2. Visualização dos alunos supervisionados.
3. Aprovação ou recusa de documentos.
4. Visualização das visitas agendadas.
5. Envio de notificações aos alunos.

### 4.3 Fluxo da Escola

1. Login.
2. Gerenciamento de horários disponíveis.
3. Confirmação ou reagendamento de visitas.
4. Visualização de agendamentos realizados.
5. Atualização de dados cadastrais.

---

## 5. Planejamento de Desenvolvimento do App

### 5.1 Etapas Gerais

1. **Configuração Inicial do Projeto**
   - [x] Estruturar o projeto Flutter (já iniciado).
   - [x] Definir estrutura de pastas (modelos, telas, widgets, serviços, utilitários).
   - [x] Configurar gerenciamento de estado (Provider).

2. **Modelagem e Dados Mockados**
   - [x] Definir modelos de dados (Aluno, Professor, Escola, Documento, Visita, Usuário).
   - [ ] Implementar telas e lógica do front-end utilizando dados mockados (sem persistência):
     1. [x] Tela de Login
     2. [x] Tela Home do Aluno
     3. [x] Tela Home do Professor
     4. [x] Tela Home da Escola
     5. [x] Tela de Cadastro de Aluno
     6. [x] Tela de Cadastro de Professor
     7. [x] Tela de Cadastro de Escola
     8. [x] Tela de Upload/Assinatura de Documentos
     9. [x] Tela de Agendamento de Visitas
    10. [x] Tela de Histórico de Atividades/Documentos
    11. [x] Tela de Aprovação/Recusa de Documentos (Professor)
    12. [x] Tela de Visualização de Agendamentos (Professor/Escola)
    13. [x] Tela de Notificações
    14. [x] Tela de Gerenciamento de Horários (Escola)
    15. [x] Tela de Atualização de Dados Cadastrais (Escola)

3. **Persistência Local (SQLite)**
   - [ ] Escolher e configurar SQLite para persistência local.
   - [ ] Implementar serviços para manipulação dos dados reais no banco.
   - [ ] Integrar telas e controladores com o banco de dados.

4. **Autenticação e Perfis (Simulados)**
   - [ ] Implementar telas e lógica de login para Aluno, Professor e Escola (sem autenticação real).
   - [ ] Gerenciar troca de perfis e permissões de acesso.

5. **Funcionalidades do Aluno**
   - [ ] Upload, preenchimento e assinatura digital de documentos.
   - [ ] Agendamento de visitas.
   - [ ] Consulta ao histórico e status de documentos.
   - [ ] Recebimento de notificações.

6. **Funcionalidades do Professor**
   - [ ] Visualização de alunos supervisionados.
   - [ ] Aprovação/recusa de documentos.
   - [ ] Visualização de agendamentos.
   - [ ] Envio de notificações.

7. **Funcionalidades da Escola**
   - [ ] Gestão de horários para visitas.
   - [ ] Confirmação/reagendamento de visitas.
   - [ ] Atualização de dados cadastrais.
   - [ ] Visualização de agendamentos.

8. **Notificações e Painéis**
   - [ ] Implementar sistema de notificações locais.
   - [ ] Criar painéis de acompanhamento para cada tipo de usuário.

9. **Testes e Validação**
   - [ ] Testes unitários e de integração.
   - [ ] Testes de usabilidade e responsividade.
   - [ ] Validação de requisitos funcionais e não funcionais.

10. **Publicação e Distribuição**
    - [ ] Gerar builds para Android, iOS, Web e Desktop.
    - [ ] Testar instalação e funcionamento em cada plataforma.
    - [ ] Documentar processo de build e publicação.

---

## 6. Funcionalidades Testáveis

- Login e autenticação simulada para todos os perfis.
- Upload e assinatura digital de documentos.
- Agendamento e confirmação de visitas.
- Aprovação/recusa de documentos pelo professor.
- Notificações locais automáticas e manuais.
- Painéis de acompanhamento individualizados.
- Responsividade e performance.
- Persistência local dos dados.

---

## 7. Próximos Passos

1. Finalizar modelagem de dados e estrutura de pastas.
2. Configurar persistência local (Hive, SQLite, etc).
3. Implementar telas e lógica de autenticação simulada.
4. Desenvolver fluxo de upload e assinatura de documentos.
5. Criar agendamento de visitas.
6. Testar funcionalidades iniciais.
7. Atualizar este README após cada etapa concluída.

---

## 8. Estrutura de Pastas (MVC)

```
lib/
│
├── models/         # Modelos de dados (Aluno, Professor, Documento, etc)
│
├── views/          # Telas e widgets principais (UI)
│   ├── aluno/
│   ├── professor/
│   ├── escola/
│   └── shared/     # Telas e widgets compartilhados
│
├── controllers/    # Lógica de controle, manipulação de dados, regras de negócio
│   ├── aluno_controller.dart
│   ├── professor_controller.dart
│   ├── escola_controller.dart
│   └── ...
│
├── services/       # Serviços auxiliares (persistência local, notificações, etc)
│
├── utils/          # Utilitários, helpers, constantes, temas, etc
│
├── main.dart       # Ponto de entrada do app
│
└── routes/         # Gerenciamento de rotas e navegação
```

### Descrição das Pastas

- **models/**: Define as classes de dados (ex: Aluno, Professor, Documento, Visita).
- **views/**: Contém as telas (UI) separadas por perfil e widgets compartilhados.
- **controllers/**: Gerencia o estado, lógica de negócio e comunicação entre views e models.
- **services/**: Serviços para persistência local, notificações, autenticação simulada, etc.
- **utils/**: Funções utilitárias, temas, constantes globais.
- **routes/**: Arquivos de configuração de rotas e navegação do app.

---

## Padrão Visual e Responsividade

O app utiliza um tema global moderno, com as seguintes características:

- **Paleta de cores:** tons de roxo, verde, branco e cinza claro para fundo, botões e destaques.
- **Tipografia:** títulos grandes e destacados, textos legíveis e amigáveis.
- **Botões e campos:** arredondados, com ícones temáticos e feedback visual.
- **Responsividade:** todas as telas adaptam-se a diferentes tamanhos de tela (mobile, tablet, desktop) usando LayoutBuilder, AnimatedContainer e SingleChildScrollView.
- **Animações:** transições suaves em botões, cards e containers.
- **Ícones:** presentes em todos os botões, campos e listas para reforçar a usabilidade.
- **Layout centralizado:** conteúdo sempre centralizado e com espaçamento adequado.

> **Atenção:** Todas as novas telas e componentes devem seguir este padrão visual para garantir uma experiência consistente e agradável ao usuário.

---
