import 'dart:convert';

import 'package:exibe_imagens/src/models/image_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/image_model.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State<App> createState(){
    return AppState();
  }
}

class AppState extends State<App> {
  //começamos de 1, pois não há página 0 na Pexels
  int numeroImagens = 0;
  List<ImageModel> imagens = [];

  void obterImagem() async {
    var url = Uri.https(
      'api.pexels.com',
      '/v1/search',
      //número da página requisitada igual ao valor existente em numeroImagens
      {'query': 'people', 'page': '$numeroImagens', 'per_page': '1'},
    );
    var req = http.Request('get', url);
    req.headers.addAll(
      {
        'Authorization':'cole aqui a sua chave de api'
      },
    );
    final result = await req.send();
    if (result.statusCode == 200) {
      final response = await http.Response.fromStream(result);
      var decodedJSON = json.decode(response.body);
      var imagem = ImageModel.fromJSON(decodedJSON);
      setState(() {
        //incremento a cada clique
        numeroImagens++;
        imagens.add(imagem);
      });
    } else {
      print('Falhou: ${result.statusCode}');
    } 
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    ),
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Minhas Imagens"),
      ),
      floatingActionButton: FloatingActionButton( 
        onPressed: obterImagem,
        child: const Icon(Icons.add),
      ),
      body: ImageList(imagens),
    ),
  );
  }
}
