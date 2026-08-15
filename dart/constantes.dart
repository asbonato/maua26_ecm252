main(){

  //usando final
  final nome = "João";
  final idade = 17;
  print(nome);
  print(nome.runtimeType);
  print(idade);
  print(idade.runtimeType);
  //não pode mais alterar o valor
  //a checagem é em tempo de compilação
  //idade++;
  
  //é opcional informar o tipo
  final String endereco = 'Rua J';
  print(endereco.runtimeType);

  //não precisa inicializar na declaração
  final peso;
  //mas precisa inicializar antes de usar
  peso = 10.6;
  print(peso.runtimeType);

  //usando const
  
}