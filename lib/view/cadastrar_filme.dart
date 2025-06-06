import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:provider/provider.dart';
import '../model/filme.dart';
import '../state/filme_state.dart';

class CadastrarFilme extends StatefulWidget {
  const CadastrarFilme({super.key});

  @override
  State<CadastrarFilme> createState() => _CadastrarFilmeState();
}

class _CadastrarFilmeState extends State<CadastrarFilme> {
  final _formKey = GlobalKey<FormState>();

  final _imagemUrlController = TextEditingController();
  final _tituloController = TextEditingController();
  final _generoController = TextEditingController();
  final _duracaoController = TextEditingController();
  final _descricaoController = TextEditingController();

  String? _faixaEtariaSelecionada;
  int _ano = 0;
  double _pontuacao = 0.0;

  final List<String> _opcoesFaixaEtaria = [
    'Livre',
    '10',
    '12',
    '14',
    '16',
    '18',
  ];

  @override
  void dispose() {
    _imagemUrlController.dispose();
    _tituloController.dispose();
    _generoController.dispose();
    _duracaoController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  void _salvarFilme() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final novoFilme = Filme(
        imagemUrl: _imagemUrlController.text,
        titulo: _tituloController.text,
        genero: _generoController.text,
        faixaEtaria: _faixaEtariaSelecionada!,
        duracao: _duracaoController.text,
        pontuacao: _pontuacao,
        descricao: _descricaoController.text,
        ano: _ano,
      );

      await Provider.of<FilmeState>(
        context,
        listen: false,
      ).adicionarFilme(novoFilme);

      if (!mounted) return;
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Cadastrar Filme'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _imagemUrlController,
                  decoration: const InputDecoration(labelText: 'URL da Imagem'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe a URL da imagem';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _tituloController,
                  decoration: const InputDecoration(labelText: 'Título'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o título';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _generoController,
                  decoration: const InputDecoration(labelText: 'Gênero'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o gênero';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Faixa Etária'),
                  items:
                      _opcoesFaixaEtaria
                          .map(
                            (faixa) => DropdownMenuItem(
                              value: faixa,
                              child: Text(faixa),
                            ),
                          )
                          .toList(),
                  value: _faixaEtariaSelecionada,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Selecione a faixa etária';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _faixaEtariaSelecionada = value;
                    });
                  },
                  onSaved: (value) {
                    _faixaEtariaSelecionada = value;
                  },
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _duracaoController,
                  decoration: const InputDecoration(labelText: 'Duração'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe a duração';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                const Text('Pontuação'),
                const SizedBox(height: 8),
                SmoothStarRating(
                  allowHalfRating: true,
                  onRatingChanged: (value) {
                    setState(() {
                      _pontuacao = value;
                    });
                  },
                  starCount: 5,
                  rating: _pontuacao,
                  size: 40.0,
                  color: Colors.amber,
                  borderColor: Colors.amber,
                ),
                const SizedBox(height: 4),
                Text(
                  'Você selecionou ${_pontuacao.toStringAsFixed(1)} estrela(s)',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _descricaoController,
                  decoration: const InputDecoration(labelText: 'Descrição'),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe a descrição';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                TextFormField(
                  decoration: const InputDecoration(labelText: 'Ano'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o ano';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Digite um número válido';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _ano = int.tryParse(value!)!;
                  },
                ),
                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: _salvarFilme,
                  child: const Text('Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
