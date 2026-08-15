main(){
    String nome = "João";
  String sobrenome = 'Silva';
  String endereco = '''
  Rua B,
  número 1234, Vila J''';
  bool deMaior = false;
  int idade = 17;
  num peso = 80.5;
  double altura = 1.82;

  print('Me chamo ' + nome);
  //print('Minha idade é ' + idade + ' anos.'); não pode
  print('Minha idade é ' + idade.toString() + ' anos.');
  print('Meu sobrenome é $sobrenome');
  print('Tenho $altura m e peso $peso kg');
  print('Ano que vem terei ${idade + 1} anos.');
  print('x'*10);
  String letra = 'x';
  print(letra * 10);
}