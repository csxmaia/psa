import 'dart:io';

void main() {
  // hospedeira();
  // quantoTempoPassou();
  // calcularSalario();
}

// Exercício 01 - implemente as funções
// a) Função que solicite um número e realizar validações: (1) se é par; (2) maior que zero; (3) se é um número primo.
// função "hospedeira" : solicitar um número
void validacoesDeNumeros() {
  print("""
Selecione a validação que deseja.
  1. Validar se é par
  2. Validar maior que zero
  3. Validar se é um número primo
""");
  int opcao = int.parse(stdin.readLineSync()!);
  if (opcao == 1) {
    bool resultado = solicitarEValidarNumero((numero) {
      var resto = numero % 2;
      if (resto == 0) {
        return true;
      } else {
        return false;
      }
    });
    if (resultado) {
      print("é par");
    } else {
      print("é impar");
    }
  } else if (opcao == 2) {
    bool resultado = solicitarEValidarNumero((numero) => numero > 0);
    if (resultado) {
      print("é maior que 0");
    } else {
      print("é menor que 0");
    }
  } else {
    bool resultado = solicitarEValidarNumero(ePrimo);
    if (resultado) {
      print("é primo");
    } else {
      print("é primo");
    }
  }
}

bool solicitarEValidarNumero(Function validar) {
  print("Insira um numero");
  int numero = int.parse(stdin.readLineSync()!);
  return validar(numero);
}

bool ePrimo(int numero) {
  for (int i = 2; i < numero; i++) {
    if (numero % i == 0) {
      return false;
    }
  }
  return true;
}

// b) Função que solicite a data inicial e retorne quanto tempo passou em: (1) anos; (2) dias; e (3) horas.
void quantoTempoPassou() {
  DateTime data = solicitarData();
  int opcao = solicitarOpcao();
  if (opcao == 1) {
    int quantidade = realizarCalculoTempo(data, calcularPorAnos);
    print("${quantidade} anos se passaram");
  } else if (opcao == 2) {
    int quantidade = realizarCalculoTempo(data, calcularDias);
    print("${quantidade} dias se passaram");
  } else {
    int quantidade = realizarCalculoTempo(data, calcularPorHoras);
    print("${quantidade} horas se passaram");
  }
}

DateTime solicitarData() {
  print("Insira a data inicial (2022-04-27)");
  DateTime data = DateTime.parse(stdin.readLineSync()!);
  return data;
}

int solicitarOpcao() {
  print("""
  Selecione a opção que deseja obter.
  1. Anos
  2. Dias
  3. Horas
""");
  int opcao = int.parse(stdin.readLineSync()!);
  return opcao;
}

int realizarCalculoTempo(DateTime dataInformada, Function calcular) {
  var dataAtual = DateTime.now();
  return calcular(dataInformada, dataAtual);
}

int calcularPorAnos(DateTime dataInformada, DateTime dataAtual) {
  int quantidadeDias = dataAtual.difference(dataInformada).inDays;
  int years = quantidadeDias ~/ 365;
  return years;
}

int calcularDias(DateTime dataInformada, DateTime dataAtual) {
  return dataAtual.difference(dataInformada).inDays;
}

int calcularPorHoras(DateTime dataInformada, DateTime dataAtual) {
  return dataAtual.difference(dataInformada).inHours;
}

// c) Função que solicite a quantidade de dias trabalhadas, valor que recebe por hora e calcule o salarário para: (1) auxiliar; (2) júnior; e (3) pleno.
// Exercício 02 - para cada função "hospedeira", defina uma função anônima.

void calcularSalario() {
  print("Insira a quantidade de dias trabalhadas");
  int quantidadeDias = int.parse(stdin.readLineSync()!);
  print("Insira o valor que recebe por hora");
  double valorHora = double.parse(stdin.readLineSync()!);
  print("""
  Calcular salario para.
  1. Auxiliar
  2. Júnior
  3. Pleno
""");
  int opcao = int.parse(stdin.readLineSync()!);
  if (opcao == 1) {
    realizarCalculoSalario(
        quantidadeDias, valorHora, realizarCalculoDiasValorHora);
  } else if (opcao == 2) {
    realizarCalculoSalario(
        quantidadeDias, valorHora, realizarCalculoDiasValorHora);
  } else {
    realizarCalculoSalario(
        quantidadeDias, valorHora, realizarCalculoDiasValorHora);
  }
}

double realizarCalculoSalario(int dias, double valorHora, Function calcular) {
  return calcular(dias, valorHora);
}

double realizarCalculoDiasValorHora(int dias, double valorHora) {
  int quantidadeHoraTrabalhas = dias * 8;
  return quantidadeHoraTrabalhas * valorHora;
}
