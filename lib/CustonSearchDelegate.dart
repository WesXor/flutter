import 'package:flutter/material.dart';

class CustonSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      ),

    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return
      IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){
          close(context, "");
        },
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    // print("Resultado: pesquisa está sendo realizada.");
    close(context, query);
    return Container();

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // print("Resultado: digitado " + query);

    List<String> lista = List.empty(growable: true);

    if (query.isNotEmpty) {
      // lista de sugestoes
      lista = ["Android", "Android navegação", "IOS", "Jogos"]!.where(
          (texto) => texto.toLowerCase().startsWith( query.toLowerCase() )
      ).toList().cast<String>();


      return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: (){
              close(context, lista[index]);
            },
            title: Text(lista[index]),
          );
        },
      );
    } else {
      return Center(
        child: Text("Nenhum resultado para a pesquisa!"),
      );
    }
  }
  
  
}
