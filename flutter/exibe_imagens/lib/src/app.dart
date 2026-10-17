// =============================================================================
// Uso de variáveis de ambiente (.env) no Flutter
// =============================================================================
// A chave da API da Pexels não fica escrita no código. Ela é lida de um
// arquivo .env, que não vai para o repositório. Passos seguidos:
//
// 1. Dependência: foi adicionado o pacote flutter_dotenv no pubspec.yaml
//      dependencies:
//        flutter_dotenv: ^6.0.1
//    e depois executado: flutter pub get
//
// 2. Arquivo .env: criado na raiz do projeto (ao lado do pubspec.yaml):
//      PEXELS_API_KEY=sua_chave_aqui
//    O arquivo .env.example tem o mesmo formato, sem a chave real, e serve
//    de modelo para quem clonar o projeto (basta copiá-lo para .env).
//
// 3. .gitignore: as entradas abaixo impedem que a chave vá para o Git,
//    mas mantêm o .env.example versionado:
//      .env
//      .env.*
//      !.env.example
//
// 4. Asset: no Flutter o .env precisa ser declarado como asset no
//    pubspec.yaml, senão ele não é empacotado com o app e não é encontrado
//    em tempo de execução:
//      flutter:
//        assets:
//          - .env
//
// 5. Carregamento: em main.dart o arquivo é carregado antes de runApp.
//    Por isso main é async e usa await:
//      Future<void> main() async {
//        await dotenv.load(fileName: '.env');
//        runApp(App());
//      }
//
// 6. Leitura: aqui no app.dart o valor é obtido com
//      dotenv.env['PEXELS_API_KEY'] ?? ''
//    O "?? ''" evita null caso a variável não exista no .env.
//
// Observação: como o .env vira um asset, ele fica dentro do pacote do app
// (APK/IPA/web). Isso evita expor a chave no repositório, mas não a protege
// de quem tem o app instalado. Em produção, o ideal é que a chamada à API
// passe por um backend próprio que guarde a chave.
// =============================================================================

import 'dart:convert';

import 'package:exibe_imagens/src/models/image_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State<App> createState(){
    return AppState();
  }
}

class AppState extends State<App> {
  //começamos de 1, pois não há página 0 na Pexels
  int numeroImagens = 1;
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
        'Authorization': dotenv.env['PEXELS_API_KEY'] ?? ''
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
