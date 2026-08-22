void main(){
  const idade = 19;
  if (idade > 18)
    print('Pode dirigir');
  print('Até logo!');

  if (idade > 18){
    print('Pode dirigir');
  }
  print('Até logo de novo');

  const nome = 'Ana';
  if (nome.startsWith('A')){
    print('Começa com A');
  } else {
    print('Não começa com A');
  }

  const nota = 10;
  if (nota >= 9)
    print('A');
  else if (nota >= 7)
    print('B');
  else if (nota >= 5)
    print('C');
  else
    print('R');

  const numero = 18;
  if (numero % 2 == 0){
    print('É par');
    if (numero % 4 == 0)
      print("Divisível por 4");
    else
      print('Não é divisível por 4');
  } else {
    print('É ímpar');
    if (numero % 3 == 0)
      print("Divisível por 3");
    else
      print("Não é divisível por 3");
  }
}