class Filme {
  int? id;
  String imagemUrl;
  String titulo;
  String genero;
  String faixaEtaria;
  String duracao;
  double pontuacao;
  String descricao;
  int ano;

  Filme({
    this.id,
    required this.imagemUrl,
    required this.titulo,
    required this.genero,
    required this.faixaEtaria,
    required this.duracao,
    required this.pontuacao,
    required this.descricao,
    required this.ano,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'imagemUrl': imagemUrl,
      'titulo': titulo,
      'genero': genero,
      'faixaEtaria': faixaEtaria,
      'duracao': duracao,
      'pontuacao': pontuacao,
      'descricao': descricao,
      'ano': ano,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  factory Filme.fromMap(Map<String, dynamic> map) {
    return Filme(
      id: map['id'] as int?,
      imagemUrl: map['imagemUrl'] ?? '',
      titulo: map['titulo'] ?? '',
      genero: map['genero'] ?? '',
      faixaEtaria: map['faixaEtaria'] ?? '',
      duracao: map['duracao'] ?? '',
      pontuacao: (map['pontuacao'] ?? 0).toDouble(),
      descricao: map['descricao'] ?? '',
      ano: map['ano'] ?? 0,
    );
  }
}
