import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../model/filme.dart';

class DetalheFilmeView extends StatelessWidget {
  final Filme filme;

  const DetalheFilmeView({super.key, required this.filme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Detalhes do Filme'),
        backgroundColor: Colors.blue,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              filme.imagemUrl.isNotEmpty
                  ? Image.network(
                    filme.imagemUrl,
                    width: 120,
                    height: 180,
                    fit: BoxFit.cover,
                  )
                  : Container(
                    width: 120,
                    height: 180,
                    color: Colors.grey[300],
                    child: const Icon(Icons.movie, size: 60),
                  ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      filme.titulo,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),
                    Text('Gênero: ${filme.genero}'),
                    const SizedBox(height: 4),
                    Text('Faixa Etária: ${filme.faixaEtaria}'),
                    const SizedBox(height: 4),
                    Text('Duração: ${filme.duracao}'),
                    const SizedBox(height: 4),
                    Text('Ano: ${filme.ano}'),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text('Pontuação:'),
                        const SizedBox(width: 8),
                        RatingBarIndicator(
                          rating: filme.pontuacao,
                          itemBuilder:
                              (context, _) =>
                                  const Icon(Icons.star, color: Colors.amber),
                          itemCount: 5,
                          itemSize: 24.0,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Descrição:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(filme.descricao),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
