void main(){
  const nota = 10;
  switch (nota){
    case 10:
      print('A'); //break implícito
    case 9:
      print ('A');//break implícito
    case 8:
      print('B');//break implícito
    case 7:
      print('C');//break implícito
    case 6:
      print('D');//break implícito
    case 5:
      print('E');//break implícito
    default:
      print('R');//break implícito
  }

  //fall through para cláusulas vazias
    switch (nota){
    case 10:

    case 9:
      print ('A');//break implícito
    case 8:
      print('B');//break implícito
    case 7:
      print('C');//break implícito
    case 6:
      print('D');//break implícito
    case 5:
      print('E');//break implícito
    default:
      print('R');//break implícito
  }

   //dois valores no mesmo case
    switch (nota){
    case 10 || 9:
      print ('A');//break implícito
    case 8:
      print('B');//break implícito
    case 7:
      print('C');//break implícito
    case 6:
      print('D');//break implícito
    case 5:
      print('E');//break implícito
    default:
      print('R');//break implícito
  }

  //posso usar strings
  var vaiChover = "Sim";
  switch (vaiChover){
    case 'Sim':
      print('Leve guarda chuva');
    default:
      print('Não precisa levar guarda chuva');
  }

  double nota2 = 9.7;
  switch (nota2){
    case > 9 && <= 10:
      print('A');
    case > 8 && <= 9:
      print('B');  
    case > 7 && <= 8:
      print('C');
    case > 6 && <= 7:
      print('D');
    case > 5 && <= 6:
      print('E');
    default:
      print('R');
  }

  //usando listas
  var frutas = ['banana', 'laranja'];
  switch (frutas){
    case ['banana', 'laranja']:
      print('banana e laranja');
    case ['banana', 'maça']:
      print('banana e maça');
    default:
      print('não sei');
  }

  //usando continue
  var nota3 = 10;
  switch (nota3){
    case 10:
      print('Parabéns, você tirou 10!');
      continue conceito;
    conceito:
    case 9:
      print('Você tirou A');
  }

  //switch expression
  var mediaFinal =5;
  final conceito = switch(mediaFinal){
    10 || 9 => 'A',
    8 => 'B',
    7 => 'C',
    6 => 'D',
    5 => 'E',
    _ => 'R'
  };
  print(conceito);
}