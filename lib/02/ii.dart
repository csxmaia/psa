import 'dart:io';

void show() {
  print("""
    1. Bonificar salario
    2. Descontar salario
    3. Bonus salario
""");
  int opcao = int.parse(stdin.readLineSync()!);

  print("Informe o salário");
  double salario = double.parse(stdin.readLineSync()!);

  if (opcao == 1) {
    double valor = inputValor();
    realizarOperacoes(salario, valor, bonificarValorSalario);
  } else if (opcao == 2) {
    double valor = inputValor();
    realizarOperacoes(salario, valor, (salario, valor) => salario - calcularValorNoSalario(salario, valor));
  } else {
    realizarOperacoes(salario, null, bonusValorSalario);
  }
}

double inputValor() {
  print("Informe o valor de Bonificação");
  return double.parse(stdin.readLineSync()!);
}

double realizarOperacoes(double salario, double? valor, Function acao) {
  if (valor != null) {
    return acao(salario, valor);
  } else {
    return acao(salario);
  }
}

double bonificarValorSalario(double salario, double valor) {
  double valorBonificacao = calcularValorNoSalario(salario, valor);
  return salario + valorBonificacao;
}

double descontarValorSalario(double salario, double valor) {
  double valorDesconto = calcularValorNoSalario(salario, valor);
  return salario - valorDesconto;
}

double bonusValorSalario(double salario) {
  double valor = 10;
  double valorBonus = calcularValorNoSalario(salario, valor);
  return salario + valorBonus;
}

//função que calcula o valor com base no salario
double calcularValorNoSalario(double salario, double valor) {
  return salario * (valor / 100);
}
