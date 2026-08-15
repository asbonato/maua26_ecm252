main(){
  //variável estaticamente tipada (int)
  //em tempo de compilação e execução é int
  int a = 2;
  print(a.runtimeType);

//erro em tempo de compilação ao tentar chamar um método 
//que a classe int não possui
//  a.indexOf("b");
//erro ao atribuir uma string para um int
//a = "abc";

//variável dinamicamente tipada
//não há checagem em tempo de compilação
//em tempo de execução é int
dynamic b = 2;
print(b.runtimeType);
//vai dar erro em tempo de execução
//print(b.indexOf('b'));
//em tempo de execução é String
b = 'abc';
print(b.runtimeType);
print(b.indexOf('b'));

//inferência de tipos
//faz a inferência de que João é string em tempo de compilação
//não pode mais mudar
var nome = "João";
print(nome.runtimeType);
//dá erro se tentar atribuir outro tipo
//nome = 2;
//vale para todos os tipos
var idade = 25;
print(idade.runtimeType);
var vaiChover = true;
print(vaiChover);
var salario = 2532.3;
print(salario.runtimeType);
}