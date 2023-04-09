import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() afterSelection;

  Resposta(this.texto, this.afterSelection);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ElevatedButton(
            onPressed: afterSelection,
            child: Text(texto),
          ),
        ],
      ),
    );
  }
}
