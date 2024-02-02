import 'package:flutter/material.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inscricao.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:http/http.dart' as http;

import 'CustonSearchDelegate.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {


    List<Widget> _telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey, opacity: 0.8),
        backgroundColor: Colors.white,
        title: Image.asset(
          "imagens/youtube.png",
          width: 100,
          height: 50,
        ),
        titleTextStyle: TextStyle(
          fontSize: 20,
          color: Colors.red,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String? res = await showSearch(context: context, delegate: CustonSearchDelegate());
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  _resultado = res!;
                });
                print("Resultado digitado dentro do Home.dart: " + res!);
                print("ação: Pesquisa");
              });
            },
          ),


          /*
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              print("ação: videocam");
            },
          ),

          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              print("ação: Conta");
            },
          ), */
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: _telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },

        type: BottomNavigationBarType.fixed,
        // type: BottomNavigationBarType.shifting,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Colors.orange,
            label: "Início"!,
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.red,

            label: "Em alta"!,

            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.blue,

            label: "Inscrições"!,

            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.green,

            label: "Biblioteca"!,

            icon: Icon(Icons.library_add),
          ),
        ],
      ),
    );
  }
}
