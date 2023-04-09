import 'package:cacheta_page_2/modelo/jogador.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class JogadoresItens extends StatelessWidget {
  const JogadoresItens({
    Key? key,
    required this.jogador,
    required this.onDelete,
  }) : super(key: key);

  final Jogador jogador;
  final void Function(Jogador) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(), //estilo da motion
          extentRatio: 0.2, //limita o tamanho da caixa do "deletar"
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(
                  5), //deixa o "deletar" com bordas redondas
              onPressed: () => onDelete(jogador),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Deletar',
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[200],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                jogador.nome,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
