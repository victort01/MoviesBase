import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../state/filme_state.dart';
import 'cadastrar_filme.dart';
import 'detalhe_filme.dart';
import 'editar_filme.dart';

class ListarFilmesView extends StatefulWidget {
  const ListarFilmesView({super.key});

  @override
  State<ListarFilmesView> createState() => _ListarFilmesViewState();
}

class _ListarFilmesViewState extends State<ListarFilmesView> {
  static const String nomeDoGrupo = 'Ethan e Paulo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Lista de Filmes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (_) => AlertDialog(
                      title: const Text('Nome do Grupo'),
                      content: Text(nomeDoGrupo),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
              );
            },
          ),
        ],
      ),
      body: Consumer<FilmeState>(
        builder: (context, state, child) {
          final filmes = state.filmes;
          if (filmes.isEmpty) {
            return const Center(child: Text('Nenhum filme cadastrado.'));
          }
          return ListView.builder(
            itemCount: filmes.length,
            itemBuilder: (context, index) {
              final filme = filmes[index];

              final messenger = ScaffoldMessenger.of(context);
              final filmeState = Provider.of<FilmeState>(
                context,
                listen: false,
              );

              return Dismissible(
                key: Key(filme.id.toString()),
                direction: DismissDirection.endToStart,

                onDismissed: (_) async {
                  await state.removerFilme(filme.id!);

                  if (!mounted) return;

                  messenger.showSnackBar(
                    SnackBar(content: Text('Filme "${filme.titulo}" removido')),
                  );
                },

                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),

                child: ListTile(
                  leading:
                      filme.imagemUrl.isNotEmpty
                          ? Image.network(
                            filme.imagemUrl,
                            width: 50,
                            fit: BoxFit.cover,
                          )
                          : const SizedBox(width: 50, child: Icon(Icons.movie)),
                  title: Text(filme.titulo),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(filme.genero),
                      Text('Duração: ${filme.duracao}'),
                      RatingBarIndicator(
                        rating: filme.pontuacao,
                        itemBuilder:
                            (context, _) =>
                                const Icon(Icons.star, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),

                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext sheetContext) {
                        return SafeArea(
                          child: Wrap(
                            children: [
                              ListTile(
                                leading: const Icon(Icons.visibility),
                                title: const Text('Exibir Dados'),
                                onTap: () {
                                  Navigator.pop(sheetContext);

                                  Navigator.push(
                                    sheetContext,
                                    MaterialPageRoute(
                                      builder:
                                          (_) => DetalheFilmeView(filme: filme),
                                    ),
                                  );
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.edit),
                                title: const Text('Alterar'),
                                onTap: () {
                                  Navigator.pop(sheetContext);

                                  Navigator.push(
                                    sheetContext,
                                    MaterialPageRoute(
                                      builder:
                                          (_) => EditarFilmeView(filme: filme),
                                    ),
                                  ).then((_) {
                                    filmeState.carregarFilmes();
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {
          final filmeState = Provider.of<FilmeState>(context, listen: false);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CadastrarFilme()),
          ).then((_) {
            filmeState.carregarFilmes();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
