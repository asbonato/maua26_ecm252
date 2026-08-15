void main() {
  String nome = "João";
  String sobrenome = 'Silva';
  String endereco = '''
  Rua B,
  número 1234, Vila J''';
  bool deMaior = false;
  int idade = 17;
  num peso = 80.5;
  double altura = 1.82;
  String comoPularLinha = r"Pule linha com \n";
  print(nome);
  print(sobrenome);
  print(endereco);
  print(deMaior);
  print(idade);
  print(peso);
  print(altura);
  print(comoPularLinha);
  //visualizando os runtime types
  print(nome.runtimeType);
  print(sobrenome.runtimeType);
  print(endereco.runtimeType);
  print(deMaior.runtimeType);
  print(idade.runtimeType);
  print(peso.runtimeType);
  print(altura.runtimeType);
  print(comoPularLinha.runtimeType);
  peso = 80;
  print(peso.runtimeType);

  //também dá para exibir o tipo de literais
  print(2.runtimeType);
  print(2.0.runtimeType);
  print(true.runtimeType);
  print('true'.runtimeType);
}