import 'package:exibe_imagens/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  var app = App();
  runApp(app);
}
