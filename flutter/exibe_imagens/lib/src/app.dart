import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  State<App> createState(){
    return AppState();
  }
}

class AppState extends State<App> {
  int numeroImagens = 0;
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
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() => numeroImagens++);
        } 
      ),
      body: Text('$numeroImagens'), //parâmetro entregue ao construtor do Scaffold
    ),
  );
  }
}
