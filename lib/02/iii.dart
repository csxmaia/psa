import 'dart:io';

import 'ii.dart';

//Objetivo: implementar funciton parameters, anonymous functions e arrow functions utilizando um contexto de cadastros

void show() {
  List<String> viagens = [];
  List<String> paises = [];
  List<double> gastos = [];

  print("""
    1. Cadastrar Viagem
    2. Cadastrar País
    3. Cadastrar baixa no saldo pós viagem
""");

  int opcao = int.parse(stdin.readLineSync()!);
  if (opcao == 1) {
    String viagem = solicitarInformacao("Insira um titulo para a sua viagem");
    viagens =
        realizarOperacoes(viagens, viagem, cadastrarViagem) as List<String>;
  } else if (opcao == 2) {
    String pais = solicitarInformacao("Insira o nome do pais");
    paises = realizarOperacoes(paises, pais, (paises, pais) => paises.add(pais))
        as List<String>;
  } else {
    double gasto = double.parse(solicitarInformacao("Insira o gasto"));
    gastos = realizarOperacoes(gastos, gasto, cadastrarGastos) as List<double>;
  }
}

String solicitarInformacao(String mensagem) {
  print(mensagem);
  return stdin.readLineSync()!;
}

List<dynamic> realizarOperacoes(
    List<dynamic> list, dynamic dado, Function acao) {
  return acao(list, dado);
}

List<String> cadastrarViagem(List<String> viagens, String viagem) {
  viagens.add(viagem);
  return viagens;
}

List<String> cadastrarPais(List<String> paises, String pais) {
  paises.add(pais);
  return paises;
}

List<double> cadastrarGastos(List<double> gastos, double gasto) {
  gastos.add(gasto);
  return gastos;
}
