import '../model/filme.dart';
import '../dao/filme_dao.dart';

class FilmeService {
  final _dao = FilmeDAO();

  Future<void> adicionarFilme(Filme filme) async {
    await _dao.inserirFilme(filme);
  }

  Future<List<Filme>> buscarFilmes() async {
    return await _dao.listarFilmes();
  }

  Future<void> atualizarFilme(Filme filme) async {
    await _dao.atualizarFilme(filme);
  }

  Future<void> removerFilme(int id) async {
    await _dao.deletarFilme(id);
  }
}
