import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';

import '../model/Video.dart';


class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _listaVideos(){
    // Future<List<Video>> videos;
    Api api = Api();
    // videos = api.pesquisar("");
    // return videos;
    return api.pesquisar("");
  }
  @override
  Widget build(BuildContext context) {

    
    return  FutureBuilder<List<Video>>(
        future: _listaVideos(),
        builder: (context, snapshot){
          switch(snapshot.connectionState) {
            case ConnectionState.none :
            case ConnectionState.waiting :
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active :
            case ConnectionState.done :
              if (snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (context, index){
                      return Column(
                        children: [
                          Text("Testes  wwww" + index.toString()),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      height: 3,
                      color: Colors.red,
                    ),
                    itemCount: snapshot.data != null ? snapshot.data!.length : 0,
                );
              } else {
                return Center(
                  child: Text("Nenhum dado a ser exibido!!!"),
                );
              }
              break;


          }
        });
  }
}
