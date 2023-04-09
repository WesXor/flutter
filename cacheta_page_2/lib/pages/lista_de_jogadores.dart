import 'package:flutter/material.dart';
import 'package:cacheta_page_2/widgets/jogadores_itens.dart';
import 'package:cacheta_page_2/modelo/jogador.dart';

class ListaDeJogadores extends StatefulWidget {
  ListaDeJogadores({Key? key}) : super(key: key);

  @override
  State<ListaDeJogadores> createState() => _ListaDeJogadoresState();
}

class _ListaDeJogadoresState extends State<ListaDeJogadores> {
  final TextEditingController nomeController = TextEditingController();
  List<Jogador> jogadores = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: nomeController,
                        decoration: InputDecoration(
                          // prefix: Text('CodingwithDhrumil'),
                          // helperText: 'CodingwithDhrumil',
                          labelText: 'Adicione um jogador',
                          border: OutlineInputBorder(),
                          // hintText: 'Estudar Flutter',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String nome = nomeController.text;
                        setState(() {
                          Jogador newJogador = Jogador(
                            nome: nome,
                            pontos: 0,
                            saldo: 0,
                            dataTime: DateTime.now(),
                          );
                          jogadores.add(newJogador);
                        });
                        nomeController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff00d7f3),
                          padding: const EdgeInsets.all(14)),
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Jogador jogador in jogadores)
                        JogadoresItens(
                          jogador: jogador,
                          onDelete: onDelete,
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Você possui ${jogadores.length} jogadores cadastrados',
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff00d7f3),
                          padding: const EdgeInsets.all(14)),
                      child: Text(
                        'Limpar tudo',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onDelete(Jogador jogador) {
    setState(() {
      jogadores.remove(jogador);
    });
  }
}
