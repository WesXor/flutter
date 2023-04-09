import 'package:flutter/material.dart';
import 'package:cacheta_page_2/pages/lista_de_jogadores.dart';

void main() {
  runApp(Cacheta());
}

class Cacheta extends StatelessWidget {
  const Cacheta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: ListaDeJogadores());
  }
}
