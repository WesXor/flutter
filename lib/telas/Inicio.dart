import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import '../model/Video.dart';


class Inicio extends StatefulWidget {
  // const Inicio({super.key});

  String pesquisa;

  Inicio( this.pesquisa);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _listaVideos(String pesquisa){
    // Future<List<Video>> videos;
    Api api = Api();
    // videos = api.pesquisar("");
    // return videos;
    return api.pesquisar( pesquisa );
  }
  @override
  Widget build(BuildContext context) {


    return  FutureBuilder<List<Video>>(
        future: _listaVideos(widget.pesquisa),
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
                      List<Video>? videos = snapshot.data;
                      Video video = videos![index];
                      return Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: video.imagem != null ? NetworkImage(video.imagem!) : NetworkImage(video.imagem!),

                              )
                            ),
                          ),
                          ListTile(
                            title: Text(video.titulo ?? "Titulo padrão"),
                            subtitle: Text(video.canal ?? "Descricao Padrão"),
                          ),
                          // Text("Testes " + index.toString()),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      height: 3,
                      color: Colors.grey,
                    ),
                    itemCount: snapshot.data != null ? snapshot.data!.length : 0,
                );
              } else {
                return Center(
                  child: Text("Nenhum dado a ser exibido!"),
                );
              }
              break;


          }
        });
  }
}
