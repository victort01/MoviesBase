import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state/filme_state.dart';
import 'view/listar_filmes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => FilmeState(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filmes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const ListarFilmesView(),
    );
  }
}
