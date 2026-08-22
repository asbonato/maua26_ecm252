import 'dart:io';
void main(){
  stdout.writeln('Digite o seu nome:');
  var nome = stdin.readLineSync();
  stdout.write('Olá, $nome!');

  stdout.writeln('Digite a sua idade:');
  int idade = int.parse(stdin.readLineSync()!);
  stdout.write('Você tem $idade anos.');
}