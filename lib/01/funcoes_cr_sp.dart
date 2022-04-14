import 'dart:io';

void show() {
  // var valor = verificarAprovacao();
  // print('O aluno está ' + valor);

  // var saldo = calcularSalario();

  var lista = ["França", "Espanha", "Estados Unidos", "China"];
  var caractereBusca = stdin.readLineSync()!;
  var viagensFiltradas = filtroBuscarViagensCadatradas(lista, caractereBusca);
  print("Viagens filtradas:");
  for (var viagem in viagensFiltradas) {
    print(viagem);
  }
}

String verificarAprovacao() {
  print('1º nota: ');
  double nota1 = double.parse(stdin.readLineSync()!);

  print('2º nota: ');
  double nota2 = double.parse(stdin.readLineSync()!);

  double media = (nota1 + nota2) / 2;

  if (media > 6) {
    return 'aprovado';
  } else {
    return 'reprovado';
  }
}

double calcularSalario() {
  print('Salario: ');
  double salario = double.parse(stdin.readLineSync()!);

  print('Desconto: ');
  double desconto = double.parse(stdin.readLineSync()!);

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
