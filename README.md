
# 🎬 Aplicativo de Gerenciamento de Filmes

Este é um projeto Flutter desenvolvido como exercício final da disciplina **Programação para Dispositivos Móveis (2025.1)** do curso de Ciência da Computação. O aplicativo tem como objetivo permitir o cadastro, edição, exclusão, visualização e listagem de filmes, utilizando banco de dados local.

## 📱 Funcionalidades

- ✅ Cadastro de filmes com os seguintes campos:
  - ID
  - URL da imagem
  - Título
  - Gênero
  - Faixa etária
  - Duração
  - Pontuação (0 a 5)
  - Descrição
  - Ano

- 🔍 Buscar filmes cadastrados
- ✏️ Alterar e excluir filmes
- 📋 Visualizar detalhes do filme
- ⭐ Avaliação com estrelas (Rating)
- 📦 Armazenamento local utilizando `sqflite`
- ⚠️ Validação de formulário com mensagens de erro
- 📥 Imagens exibidas a partir de URLs externas
- 🧭 Menu de ações em cada item da lista com opções de Exibir e Editar
- 👆 Remoção com swipe usando `Dismissible`
- 👤 Alerta com o nome do grupo no botão da AppBar

## 🛠️ Tecnologias Utilizadas

- [Flutter](https://flutter.dev)
- [Dart](https://dart.dev)
- [`sqflite`](https://pub.dev/packages/sqflite) – banco de dados local
- [`flutter_rating_bar`](https://pub.dev/packages/flutter_rating_bar) – para avaliação com estrelas
- [`smooth_star_rating_null_safety`](https://pub.dev/packages/smooth_star_rating_null_safety) – alternativa de rating

## 📸 Telas do App

- Tela de Listagem com swipe para deletar
- Formulário de Cadastro com validação
- Menu de Opções com ações de "Exibir" e "Alterar"
- Tela de Detalhes do Filme

## 🚀 Como Executar

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/nome-do-repo.git
   cd nome-do-repo
   ```

2. Instale as dependências:
   ```bash
   flutter pub get
   ```

3. Execute o app:
   ```bash
   flutter run
   ```

## 👥 Grupo

**Integrantes:**
- Nome do Aluno(a) 1
- Ethan Herbert Coelho Godinho de Castro
- Paulo Victor Oliveira de Barros Araújo

> Nomes também exibidos em alerta ao clicar no botão no AppBar.

## 📝 Requisitos Atendidos

Conforme documento oficial da disciplina:

- [x] Cadastro com validação
- [x] Listagem com imagem e pontuação
- [x] Edição e exclusão de registros
- [x] Exibição de detalhes
- [x] Menu de ações por item
- [x] Alerta com nome do grupo

---

**Desenvolvido para fins acadêmicos.**
