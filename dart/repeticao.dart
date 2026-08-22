void main(){
  //for regular
  for (int i = 0; i < 10; i++)
    print(i);

  //for each
  const nomes = ['Pedro', 'Maria', 'João'];
  for (final nome in nomes)
    print(nome);

  //as 3 regiões do for são opcionais
  for( ; ; ){
    print('loop infinito');
    break; //para ser finito
  }

  //while
  int contador = 0;
  while (contador <= 10){
    print('contador $contador');
    contador ++;
  }

  //do-while
  int i = 0;
  do {
    print("O valor de i é $i");
    i++;
  } while (i < 10);
}