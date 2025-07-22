# Planejamento, Análise de Requisitos e Modelagem de Dados - Sistema de Estágio Supervisionado (Versão Atualizada)

## 1. Planejamento de Melhoria do Processo

**Objetivo:** Desenvolver uma plataforma única de estágio supervisionado, permitindo que Alunos, Professores e Escolas gerenciem digitalmente documentos, visitas e supervisão de forma segura, rastreável e ágil.

**Escopo:**

* Plataforma Web responsiva.
* Login individual para Aluno, Professor e Escola.
* Upload, preenchimento e assinatura digital de documentos.
* Gestão de visitas às escolas.
* Painéis de acompanhamento específicos para cada usuário.
* Notificações automáticas de status.

**Tecnologias:**

* Front-end: React ou Vue.js.
* Back-end: Node.js ou Django.
* Banco de Dados: PostgreSQL.
* Hospedagem: AWS, Azure ou GovCloud.

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

* RR1: Front-end em React ou Vue.js; Back-end em Node.js ou Django.
* RR2: Utilização de PostgreSQL.
* RR3: Hospedagem em nuvem.
* RR4: Entrega até o fim do semestre letivo de 2025.

## 3. Modelagem de Dados

A modelagem de dados considerará as entidades **Aluno, Professor, Escola, Documento, Visita, Usuário** e os fluxos de aprovação, agendamento e rastreabilidade dos processos.

* Diagrama Entidade-Relacionamento e Relacional serão gerados e vinculados a este documento para acompanhamento técnico no desenvolvimento do sistema.

## 4. Etapas Detalhadas

### 4.1 Fluxo do Aluno

1. Login.
2. Upload e preenchimento de documentos.
3. Assinatura digital.
4. Agendamento de visitas.
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
