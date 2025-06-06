import 'package:flutter/material.dart';
import '../model/filme.dart';
import '../controller/filme_controller.dart';

class FilmeState extends ChangeNotifier {
  final FilmeController _controller = FilmeController();
  List<Filme> _filmes = [];

  List<Filme> get filmes => _filmes;

  FilmeState() {
    carregarFilmes();
  }

  Future<void> carregarFilmes() async {
    _filmes = await _controller.listarFilmes();
    notifyListeners();
  }

  Future<void> adicionarFilme(Filme filme) async {
    await _controller.adicionarFilme(filme);
    await carregarFilmes();
  }

  Future<void> atualizarFilme(Filme filme) async {
    await _controller.atualizarFilme(filme);
    await carregarFilmes();
  }

  Future<void> removerFilme(int id) async {
    await _controller.deletarFilme(id);
    await carregarFilmes();
  }

  Filme? buscarFilmePorId(int id) {
    try {
      return _filmes.firstWhere((f) => f.id == id);
    } catch (e) {
      return null;
    }
  }
}
