main(){
  //de string para int
  String idadeTextual = '25';
  int idade = int.parse(idadeTextual);
  print(idade);

  //de string para double
  String pesoTextual = '85.2';
  double peso = double.parse(pesoTextual);
  print(peso);

  //de string para num
  String alturaTextual = '1.8';
  num altura = num.parse(alturaTextual);
  print(altura);

  String logradouro = 'Rua B';
  int numero = 325;

  print(logradouro + ', número ' +numero.toString());
  print(logradouro + ', número $numero');

  int a = 1;
  //double b = a; não pode
  double b = 1;
}