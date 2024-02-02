import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyDu0FMYdi-pLPbViAAQI_HZLiFIRLHm4Dg";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    try {
      http.Response response = await http.get(Uri.parse(
          URL_BASE + "search" +
              "?part=snippet" +
              "&type=video" +
              "&maxResults=20" +
              "&order=date" +
              "&key=$CHAVE_YOUTUBE_API" +
              "&channelId=$ID_CANAL" +
              "&q=$pesquisa"
      ));

      if (response.statusCode == 200) {
        // print("Resultado body: " + response.body.toString());
        Map<String, dynamic> dadosJson = json.decode(response.body);

        // print("Resultado Items: " + dadosJson["items"][0]["id"]["videoId"].toString());
        // print("Resultado Title: " + dadosJson["items"][0]["snippet"]["title"].toString());

        List<Video> videos = dadosJson["items"].map<Video>(
            (map) {
              return Video.fromJson(map);
              // return Video.converterJson(map);
            }
        ).toList();

        // for (var video in videos){
        //   print("Resultado Lista de Videos: "+ video.titulo!);
        // }
        // print("Resultado Lista: " + videos.toString());
        return videos;

        // for(var video in dadosJson["items"]) {
        //   print("Resultado video: " + video.toString());
        //
        // }
        // print("Resultado List: " + dadosJson["items"].toString());
      } else {
        throw Exception("Erro ao buscar  os vídeos" );
      }
    } catch (e) {
      throw Exception("Erro ao buscar  os vídeos: $e");

    }
  }
}