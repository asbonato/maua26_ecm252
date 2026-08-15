main(){
  //aqui tudo bem, 2 é um literal inteiro
  //promoção implícita feita pelo compilador
  double d1 = 2;
  double i1 = 2;
  //erro em tempo de compilação
  //não dá para atribuir pq i1 é inteiro e d2 é double
  //double d2 = i1;
  //podemos resolver assim
  double d2 = i1.toDouble();
  print(i1);
  print(d1);
  print(d2);

  double a = 1.2;
  //int b = (int)a; não existe

  //arredondar
  int b = a.round();
  print(b);

  //teto
  b = a.ceil();
  print(b);

  //chão
  b = a.floor();
  print(b);

  double c = 0;
  //regra de arredondamento
  for(int i = 1; i <= 100; i++){
    c = (i/100);
    print('$c ${c.round()}');
  }
}