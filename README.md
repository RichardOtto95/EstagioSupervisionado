# Planejamento, Análise de Requisitos e Modelagem de Dados do Sistema de Estágio Supervisionado

**Universidade de Brasília - UnB**
**CIC0101 - Sistemas de Informação | Turma T02 | 01/2025**
**Alunos:** Arthus Cesar Dias Fernandes, Michele Nakagomi Lebarbenchon, Richard de Carvalho Dorneles Otto
**Professora:** Eliza Helena Areias Gomes
**Brasília, 02 de Julho de 2025**

---

## 1. Planejamento de Melhoria do Processo

### Objetivo

Fornecer uma estrutura digital para centralizar o envio, preenchimento e assinatura de documentos do estágio supervisionado, além de facilitar a escolha e agendamento de visitas às escolas cadastradas, garantindo controle, rastreabilidade e agilidade para alunos, professores e responsáveis institucionais.

### Escopo de Software

* Criação de um **sistema web (plataforma integrada)** com:

  * **Central de Documentos**: Upload, preenchimento e assinatura digital dos formulários TCE, FIAE, Ficha Cadastral e Plano de Atividades.
  * **Área do Aluno e do Professor**: Acesso segmentado com login autenticado.
  * **Gestão das Escolas Parceiras**: Listagem, filtros, geolocalização e agendamento de visitas.
  * **Histórico de Atividades**: Registro de formulários entregues, planos submetidos, folhas de ponto e portfólio.
  * **Envio automatizado para o SEI** (sistema institucional).

### Problema a Ser Resolvido

O processo atual utiliza múltiplas plataformas (Aprender, SEI, SIGAA), exigindo assinaturas físicas ou envios manuais, dificultando:

* Acompanhamento em tempo real do status dos documentos.
* Rastreabilidade das entregas.
* Validação de assinaturas de forma ágil.
* Visualização das opções de escolas disponíveis.

### Proposta de Desenvolvimento

* **Tipo de sistema**: Plataforma Web Responsiva.
* **Tecnologias**:

  * Front-end: React ou Vue.js.
  * Back-end: Node.js ou Django.
  * Banco de Dados: PostgreSQL.
  * Infraestrutura: AWS, Azure ou GovCloud.
* **Funcionalidades-chave:**

  * Upload e preenchimento assistido de documentos.
  * Assinatura digital integrada (Gov.br, ICP-Brasil ou token institucional).
  * Agendamento de visitas com confirmação automática.
  * Workflow com notificações e alertas.
  * Painel de status dos documentos e estágios.
* **Recursos necessários:**

  * Desenvolvedores front e back-end.
  * Designer UX/UI.
  * Equipe de suporte e treinamento.
  * Acesso à base de escolas e formulários.

---

## 2. Análise de Requisitos

### Requisitos Funcionais

| Código | Descrição                                                                          |
| ------ | ---------------------------------------------------------------------------------- |
| RF1    | Permitir login com autenticação institucional.                                     |
| RF2    | Permitir acesso de professores à área de acompanhamento dos alunos sob supervisão. |
| RF3    | Permitir upload, preenchimento e assinatura digital dos formulários obrigatórios.  |
| RF4    | Permitir agendamento de visitas às escolas cadastradas.                            |
| RF5    | Registrar histórico de atividades dos alunos.                                      |
| RF6    | Listar escolas parceiras com filtros e geolocalização.                             |
| RF7    | Integrar ao SEI para envio automatizado de documentos.                             |
| RF8    | Apresentar painel de status do estágio supervisionado.                             |
| RF9    | Enviar notificações automáticas de pendências e atualizações.                      |

### Requisitos Não Funcionais

| Código | Descrição                                              |
| ------ | ------------------------------------------------------ |
| RNF1   | Carregamento de páginas em até 3 segundos.             |
| RNF2   | Responsividade em desktop, tablet e mobile.            |
| RNF3   | Autenticação segura via login institucional ou Gov.br. |
| RNF4   | Uptime mínimo de 99% durante o semestre letivo.        |
| RNF5   | Interface amigável com foco em usabilidade.            |
| RNF6   | Conformidade com LGPD para armazenamento de dados.     |

### Restrições

| Código | Descrição                                                                   |
| ------ | --------------------------------------------------------------------------- |
| RR1    | Utilização de React ou Vue.js no front-end e Node.js ou Django no back-end. |
| RR2    | Uso de PostgreSQL como banco de dados.                                      |
| RR3    | Hospedagem em nuvem (AWS, Azure ou GovCloud).                               |
| RR4    | Entrega até o final do semestre letivo de 2025.                             |

---

## 3. Modelagem de Dados

A modelagem foi realizada com base nos requisitos definidos, visando representar as entidades, atributos, relacionamentos e restrições utilizando notação **Entidade-Relacionamento** e modelo relacional.

### 3.1 Diagrama Relacional

Disponível em: [Ver diagrama](https://drive.google.com/file/d/1VrXcSmwC8XKH2JiH2BMX0iwxvB94Hk23/view?usp=sharing)

#### 3.1.1 Chaves Primárias

* id\_aluno (ALUNO)
* id\_professor (PROFESSOR)
* id\_usuario (USUARIO)
* id\_formulario (FORMULARIO)
* id\_portfolio (PORTFOLIO)
* id\_folha (FOLHADEPONTO)
* id\_escola (ESCOLA)
* id\_visita (VISITA)

#### 3.1.2 Chaves Estrangeiras

* FORMULARIO: id\_aluno → ALUNO
* FOLHADEPONTO: id\_aluno → ALUNO
* PORTFOLIO: id\_aluno → ALUNO
* VISITA: id\_aluno, id\_escola → ALUNO, ESCOLA
* USUARIO: id\_aluno, id\_professor (opcionais)

#### 3.1.3 Restrições de Atributos

* NOT NULL: Campos essenciais como tipo, status, login, senha, nome e email.
* NULLABLE: Campos como data\_envio e assinatura\_digital, permitindo preenchimento posterior.

#### 3.1.4 Normalização

* Modelagem em **Terceira Forma Normal (3FN)**, garantindo consistência e eliminação de redundâncias.

---

### 3.2 Diagrama Entidade-Relacionamento (MER)

Disponível em: [Ver MER](https://app.brmodeloweb.com/#!/publicview/6862246f60dbed78304de446)

#### 3.2.1 Entidades e Atributos

* **Aluno**: id\_aluno, nome, email\_institucional, matrícula.
* **Professor**: id\_professor, nome, email, área\_atuacao.
* **Usuário**: id\_usuario, login, senha, perfil.
* **Escola**: id\_escola, nome, endereço, bairro, cidade, geolocalizacao.
* **Visita**: id\_visita, data, status, id\_aluno (FK), id\_escola (FK).
* **Formulário**: id\_formulario, tipo, status, data\_envio, assinatura\_digital.
* **FolhaDePonto**: id\_folha, mes\_referencia, total\_horas, data\_envio.
* **Portfólio**: id\_portfolio, data\_envio, status.

#### 3.2.2 Relacionamentos

* Aluno submete Formulário, FolhaDePonto e Portfólio.
* Aluno realiza Visita, e Escola recebe Visita.
* Usuário representa Aluno ou Professor (exclusivo).

#### 3.2.3 Cardinalidades

* Documentos: (1,1) → (1,n) (exceto Portfólio 1:1).
* Visitas: (1,n) → (1,1).
* Usuário para Aluno/Professor: (1,1) exclusivo.

---

Caso deseje, posso gerar automaticamente um **diagrama MER no Lucidchart ou dbdiagram.io** com base neste arquivo para seus estudos ou apresentação do projeto.

