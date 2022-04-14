import "dart:io";

void show() {
  // print('1º nota: ');
  // double nota1 = double.parse(stdin.readLineSync()!);
  // print('2º nota: ');
  // double nota2 = double.parse(stdin.readLineSync()!);

  // verificarAprovacao(nota1, nota2);

  // print('Salario: ');
  // double salario = double.parse(stdin.readLineSync()!);

  // print('Desconto: ');
  // double desconto = double.parse(stdin.readLineSync()!);

  // calcularSalario(salario, desconto);

  var lista = ["França", "Espanha", "Estados Unidos", "China"];
  var caractereBusca = stdin.readLineSync()!;
  filtroBuscarViagensCadatradas(lista, caractereBusca);
}

void verificarAprovacao(double nota1, double nota2) {
  double media = (nota1 + nota2) / 2;

  if (media > 6) {
    print('aprovado');
  } else {
    print('reprovado');
  }
}

void calcularSalario(double salario, double desconto) {
  var saldo = salario;

  if (saldo >= desconto) {
    saldo -= desconto;
  }

  print(saldo);
}

void filtroBuscarViagensCadatradas(List viagens, String busca) {
  List filtered = [];
  for (var item in viagens) {
    if (item.contains(busca)) {
      filtered.add(item);
    }
  }
  print("Viagens filtradas:");
  for (var viagem in filtered) {
    print(viagem);
  }
}
