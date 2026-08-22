enum DiaSemana {SEGUNDA, TERCA, QUARTA, QUINTA, SEXTA, SABADO, DOMINGO}
void main(){
  print(DiaSemana.values);
  DiaSemana dia = DiaSemana.SEGUNDA;
  print(dia.name);
  switch (dia) {
    case DiaSemana.SEGUNDA:
      print('Não');
    case DiaSemana.TERCA:
      print(':(');
    case DiaSemana.QUARTA:
      print(':|');
    case DiaSemana.QUINTA:
      print(':)');
    case DiaSemana.SEXTA:
      print(':))');
    case DiaSemana.SABADO:
      print(':D');
    case DiaSemana.DOMINGO:
      print(':):');
  }

}