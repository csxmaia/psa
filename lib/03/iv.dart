import 'dart:io';

void main() {}

// Exercício I
// Para cada variante de função que estudamos elaborar a seguinte função:
// → função calularSalario - precisa do (i) valor salario e o (ii) valor do desconto. Fazer o desconto somente se haver saldo. No final informar o saldo.
void calcularSalario() {
  print("Insira o valor do salario");
  double salario = double.parse(stdin.readLineSync()!);
  print("Insira o valor do desconto");
  double desconto = double.parse(stdin.readLineSync()!);

// 5) Duas funções com parâmetros posicionais opcionais (valor padrão);
  descontarSalario5();
  realizarCalculoSalario(salario, desconto, descontarSalario5);
// 6) Uma função com parâmetros nomeados obrigatórios;
  descontarSalario6(desconto: desconto, salario: salario);
  realizarCalculoSalario(salario, desconto, descontarSalario6);
// 7) Uma função com parâmetros nomeados opcionais;
  descontarSalario7();
  descontarSalario7(desconto: desconto, salario: salario);
  realizarCalculoSalario(salario, desconto, descontarSalario7);
// 8) Uma função com parâmetros nomeados obrigatórios e opcionais;
  descontarSalario8(salario: salario);
  descontarSalario8(desconto: desconto, salario: salario);
  realizarCalculoSalario(salario, desconto, descontarSalario8);
// 9) Uma única função com parâmetros nomeados e posicionais;
  descontarSalario9(salario);
  descontarSalario9(salario, desconto: desconto);
  realizarCalculoSalario(salario, desconto, descontarSalario9);
}

double realizarCalculoSalario(
    double salario, double desconto, Function calcular) {
  return calcular(salario, desconto);
}

double descontarSalario5([double salario = 1200, double desconto = 60]) {
  return desconto <= salario ? salario - desconto : salario;
}

double descontarSalario6({required double salario, required double desconto}) {
  return desconto <= salario ? salario - desconto : salario;
}

double descontarSalario7({double salario = 1200, double desconto = 60}) {
  return desconto <= salario ? salario - desconto : salario;
}

double descontarSalario8({required double salario, double desconto = 60}) {
  return desconto <= salario ? salario - desconto : salario;
}

double descontarSalario9(double salario, {double desconto = 60}) {
  return desconto <= salario ? salario - desconto : salario;
}

// Exercício II
// Pensar em um projeto único - quanto maior o escopo melhor - possibilita pensar em vários exemplos
// Elabroar funções no escopo do projeto (autêntico)
// Fazer comentários de tudo que entendeu
// Elabore:
// 1) Duas funções sem retorno e sem parâmetro;
// 2) Duas funções sem retorno e com parâmetro;
// 3) Duas funções com retorno e sem parâmetro;
// 4) Duas funções com retorno e com parâmetro;
// 5) Duas funções com parâmetros posicionais opcionais (valor padrão);
List<dynamic> viagens = [];

String solicitarInformacao(String mensagem) {
  print(mensagem);
  return stdin.readLineSync()!;
}

double calcularCustoViagemCarro(
    [double quilometragemPercorrida = 100,
    double consumoPorLitro = 10,
    double precoLitro = 7]) {
  return (quilometragemPercorrida / consumoPorLitro) * precoLitro;
}

dynamic cadastrarViagem([viagem = null, valorGasto = null]) {
  var item = {};
  if (viagem != null) {
    item = {...item, viagem: viagem};
  }
  if (valorGasto != null) {
    item = {...item, valorGasto: valorGasto};
  }
  return item;
}

void cadastrar() {
  var item = {};
  print("Insira o pais da viagem realizada");
  String pais = stdin.readLineSync()!;

  String cadastrarCustoViagem = solicitarInformacao("Deseja cadastrar o custo da viagem? (S/N)");

  if (cadastrarCustoViagem == "S") {
    double custoViagemCarro = 0;
    String custoViagemQuilometragem = solicitarInformacao("Deseja informar a quilometragem percorrida? (S/N)");
    if (custoViagemQuilometragem == "S") {
      double custoViagemQuilometragemValue = double.parse(solicitarInformacao("informe a quilometragem percorrida: "));

      String custoViagemConsumo = solicitarInformacao("Deseja informar o consumo por litro do carro? (S/N)");
      if (custoViagemConsumo == "S") { 
        double custoViagemConsumoValue = double.parse(solicitarInformacao("informe a quilometragem percorrida: "));

        String custoViagemPreco = solicitarInformacao("Deseja informar o preço do litro da gasolina? (S/N)");
        if(custoViagemPreco == "S") {
          double custoViagemConsumoValue = double.parse(solicitarInformacao("informe o preco da gasolina: "));
          custoViagemCarro = calcularCustoViagemCarro(custoViagemQuilometragemValue, custoViagemConsumoValue, custoViagemConsumoValue);
        }
      }
    }
    item = cadastrarViagem(pais, custoViagemCarro);
  } else {
    item = cadastrarViagem(pais);
  }

  viagens.add(item);

  double custoViagemCarro;
}



// 6) Uma função com parâmetros nomeados obrigatórios;

dynamic cadastrarViagem6({required viagem, required valorGasto}) {
  var item = {viagem: viagem, valorGasto: valorGasto};
  return item;
}

double calcularCustoViagemCarro6(
    {required double quilometragemPercorrida,
    required double consumoPorLitro,
    required double precoLitro}) {
  return (quilometragemPercorrida / consumoPorLitro) * precoLitro;
}

// 7) Uma função com parâmetros nomeados opcionais;

dynamic cadastrarViagem7({viagem = null, valorGasto = null}) {
  var item = {};
  if (viagem != null) {
    item = {...item, viagem: viagem};
  }
  if (valorGasto != null) {
    item = {...item, valorGasto: valorGasto};
  }
  return item;
}

double calcularCustoViagemCarro7(
    {double quilometragemPercorrida = 100,
    double consumoPorLitro = 10,
    double precoLitro = 7}) {
  return (quilometragemPercorrida / consumoPorLitro) * precoLitro;
}

// 8) Uma função com parâmetros nomeados obrigatórios e opcionais;

dynamic cadastrarViagem8({required viagem, valorGasto = null}) {
  var item = {viagem: viagem};
  if (valorGasto != null) {
    item = {...item, valorGasto: valorGasto};
  }
  return item;
}

double calcularCustoViagemCarro8(
    {required double quilometragemPercorrida,
    double consumoPorLitro = 10,
    double precoLitro = 7}) {
  return (quilometragemPercorrida / consumoPorLitro) * precoLitro;
}

// 9) Uma única função com parâmetros nomeados e posicionais;

dynamic cadastrarViagem9(viagem, {valorGasto}) {
  var item = {viagem: viagem};
  if (valorGasto != null) {
    item = {...item, valorGasto: valorGasto};
  }
  return item;
}

double calcularCustoViagemCarro9(quilometragemPercorrida,
    {double consumoPorLitro = 10, required double precoLitro}) {
  return (quilometragemPercorrida / consumoPorLitro) * precoLitro;
}

// Exercício III
// 1) Em que caso os parâmetros nomeados são úteis?
// 2) Por padrão os parâmetros nomeados são opcionais ou obrigatórios? Caso sejam opcionais, como torná-los obrigatórios?
// 3) Qual a sintaxe para fazer a chamada de uma função com os parâmetros nomeados?
// 4) É possível definir uma única função com parâmetros nomeados e posicionais?
// 5) Quais são as vantagens em utilizar parâmetros nomeados?
// 6) Quais são as diferenças entre parâmetros nomeados e posicionais?
