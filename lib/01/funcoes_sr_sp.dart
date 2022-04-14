import 'dart:io';

void show() {
  // verificarAprovacao();
  exibirPaisesDeViagensCadastradas();
}

void verificarAprovacao() {
  double nota1, nota2, media;

  stdout.write('1º nota: ');
  var entrada = stdin.readLineSync();
  if (entrada != null) {
    nota1 = double.parse(entrada);
  } else {
    nota1 = 0.00;
  }

  stdout.write('2º nota: ');
  nota2 = double.parse(stdin.readLineSync()!);

  media = (nota1 + nota2) / 2;

  if (media > 6) {
    print('aprovado');
  } else {
    print('reprovado');
  }
}

void calcularSalario() {
  print('Salario: ');
  double salario = double.parse(stdin.readLineSync()!);

  print('Desconto: ');
  double desconto = double.parse(stdin.readLineSync()!);

  var saldo = salario;

  if (saldo >= desconto) {
    saldo -= desconto;
  }

  print(saldo);
}

void exibirPaisesDeViagensCadastradas() {
  var lista = ["França", "Espanha", "Estados Unidos", "China"];
  print("Viagens");
  for (var item in lista) {
    print(item);
  }
}
