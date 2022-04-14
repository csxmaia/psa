import 'dart:io';

void show() {
  // print('1º nota: ');
  // double nota1 = double.parse(stdin.readLineSync()!);

  // print('2º nota: ');
  // double nota2 = double.parse(stdin.readLineSync()!);

  // verificarAprovacao(nota1, nota2);

  // var valor = verificarAprovacao(nota1, nota2);
  // print('O aluno está ' + valor);

  // print('Salario: ');
  // double salario = double.parse(stdin.readLineSync()!);

  // print('Desconto: ');
  // double desconto = double.parse(stdin.readLineSync()!);

  // var saldo = calcularSalario(salario, desconto);

  var lista = ["França", "Espanha", "Estados Unidos", "China"];
  var caractereBusca = stdin.readLineSync()!;
  var viagensFiltradas = filtroBuscarViagensCadatradas(lista, caractereBusca);
  print("Viagens filtradas:");
  for (var viagem in viagensFiltradas) {
    print(viagem);
  }
}

String verificarAprovacao(double nota1, double nota2) {
  double media = (nota1 + nota2) / 2;
  return (media > 6) ? 'aprovado' : 'reprovado';
}

double calcularSalario(double salario, double desconto) {
  var saldo = salario;

  if (saldo >= desconto) {
    saldo -= desconto;
  }

  return saldo;
}

List filtroBuscarViagensCadatradas(List viagens, String busca) {
  List filtered = [];
  for (var item in viagens) {
    if (item.contains(busca)) {
      filtered.add(item);
    }
  }
  return filtered;
}
