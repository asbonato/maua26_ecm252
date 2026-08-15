main(){
  const nome = 'Ana';
  const String sobrenome = 'Silva';
  const nomeCompleto = '$nome $sobrenome';
  print(nomeCompleto);
  const nomeCompleto2 = nome + ' ' + sobrenome;
  print(nomeCompleto2);

  var outroNome = 'Pedro';
  var outroSobrenome = 'Paes';

  //const outroNomeCompleto = '$outroNome $outroSobrenome';
  final outroNomeCompleto2 = '$outroNome $outroSobrenome';
  print(outroNomeCompleto2);

  const soma = 2 + 2;
  print(soma.runtimeType);

  const n1 = 2, n2 =3;
  const n3 = n1 * n2;
  print(n3);

  var n4 = 2;
  //const n5 = 2*n4;

  final n6 = 5;
  //const n7 = n6;
}