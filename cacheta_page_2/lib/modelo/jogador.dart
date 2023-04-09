import 'package:flutter/widgets.dart';

class Jogador {
  Jogador({
    required this.nome,
    required this.pontos,
    required this.saldo,
    required this.dataTime,
  });

  String nome;
  int pontos = 0;
  double saldo = 0;
  DateTime? dataTime;
  String tipoJogo = 'PT';
  String partida = '';
  String siglaJogador = '';

  // regra não posse deletar jogador se ele já participou de alguma partida
}
