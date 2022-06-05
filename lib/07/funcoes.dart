// Converter graus para celsius 
// Converter horas
// converter cambio
// calculo gasto combustivel

void main() {
}

//Calcula o custo do veiculo na viagem
//retorna o custo (de combustivel)
//retorna quantos litros de combustivel foram gastos nessa viagem
//retorna quantos litros restam no tanque após o abastecimento informado nos parametros
Object calcularCustoVeiculoNaViagem({
  required double quilometragemInicial, 
  required double quilometragemFinal, 
  required double consumoPorLitro,
  required double litrosAbastecidos, 
  required double precoPorLitro
  }) {
  double quilometragemPercorrida = quilometragemFinal - quilometragemInicial;
  double custo = calcularCustoCombustivelViagemVeiculoProprio(
    quilometragemPercorrida: quilometragemPercorrida, 
    consumoPorLitro: consumoPorLitro, 
    precoLitro: precoPorLitro
    );
  double litrosGastos = _calcularLitros(quilometragemPercorrida, consumoPorLitro);
  double litrosRestantesPosAbastecimento = litrosAbastecidos - litrosGastos;

  return {
    custo: custo, 
    litrosGastos: litrosGastos, 
    litrosRestantesPosAbastecimento: litrosRestantesPosAbastecimento
  };
}

//Calcular custo de viagem
double calcularCustoCombustivelViagemVeiculoProprio({required double quilometragemPercorrida, required double consumoPorLitro, required double precoLitro}) {
  _checkNegativeValue(quilometragemPercorrida);
  _checkNegativeValue(consumoPorLitro);
  _checkNegativeValue(precoLitro);
  return (quilometragemPercorrida / consumoPorLitro) * precoLitro;
}

//Verifica os paises que ja retornou a partir de um conjunto de caracteres
//a partir da sua lista de viagens informadas, e sua string de busca
//caso não insira a busca, retorna todas as viagens
List retornaPaisesViajadosPorBusca(List viagens, String busca) {
  if(busca.trim() == "") { 
    return viagens;
  }
  var lista = ["França", "Espanha", "Estados Unidos", "China"];
  List filtered = [];
  for (var item in viagens) {
    if (item.contains(busca)) {
      filtered.add(item);
    }
  }
  if(filtered.isEmpty) {
    throw Exception("Nenhum pais encontrado para os caracteres: $busca");
  }
  return filtered;
}

//Converter temperatura, 
//dando o grau, informar da escala atual para qual escala queer converter
double converterEscalaTemperatura({required double grau, required String converterDe, required String converterPara}) {
    //operações com celsius
    if(converterDe == "celsius") {
        if(converterPara == "fahrenheit") {
            // ignore: prefer_function_declarations_over_variables
            double calcular(valor) => (valor * 9) / 5 + 32;
            return calcular(grau);
        }
        throw Exception('Escala converterPara informada incorretamente ou inexistente.');
    }

    //operações com fahrenheit
    if(converterDe == "fahrenheit") {
        if(converterPara == "celsius") {
            // ignore: prefer_function_declarations_over_variables
            double calcular(valor) => (valor - 32) * 5 / 9;
            return calcular(grau);
        }
        throw Exception("Escala converterPara informada incorretamente ou inexistente.");
    }

    throw Exception('Escala converterDe informada incorretamente ou inexistente.');
}

//Aplica o desconto do cupom informado
double aplicarCupomViagem({required double valorDaViagem, required String cupomInserido}) {
  double valorViagemComCupom;
  double percentualCupom = retornaPercentualCupons(cupomInserido);
  double descontoCupom = valorDaViagem * (percentualCupom / 100);
  valorViagemComCupom = valorDaViagem - descontoCupom;
  return valorViagemComCupom;
}

double retornaPercentualCupons(String cupom) {
  switch(cupom) {
    case 'CUPOM15': 
      return 15;
    case 'CUPOM25':
      return 25;
    case 'CUPOMCORP': 
      return 40;
    case 'CUPOMNOVOCLIENTE':
      return 15;
    default:
      throw Exception("Cupom invalido.");
  }
}

//Calcula as diarias do hotel, a partir do valor de uma diaria e a quantidade de diarias selecionadas
//e aplica as regras que incidem sobre o valor final
double calcularDiariasHotel({required double valorDiaria, required double quantidadeDiaria}) {
  double taxa = _obterTaxa(quantidadeDiaria);

  double valorTotalDiarias = valorDiaria * quantidadeDiaria;
  double taxaDoValorDiario = valorDiaria * (taxa / 100);
  valorTotalDiarias += (quantidadeDiaria * taxaDoValorDiario);

  return valorTotalDiarias;
}

double _obterTaxa(double quantidade) {
  if(quantidade < 15) {
    return 5;
  }else if(quantidade == 15) {
    return 3;
  }else if(quantidade > 15) {
    return 2;
  }
  return 0;
}

//informa o usuario os seus direitos a partir de uma quantidade de horas que o avião está em atraso
String informarAtrasoAviao(double quantidadeHoras) {
  String textoRetorno = "";

  if(quantidadeHoras < 1) {
    return "Você ainda não possui direitos relacionados à atrasos";
  }

  if(quantidadeHoras >= 1) {
    textoRetorno = _addToString(textoRetorno, "Você tem direito a internet e ligações gratuitas.");
  } 
  if(quantidadeHoras >= 2) {
    textoRetorno = _addToString(textoRetorno, "Você tem direito a alimentação da empresa, por meio de lanches, bebidas ou vouchers.");
  } 
  if(quantidadeHoras >= 4) {
    textoRetorno = _addToString(textoRetorno, "Você tem direito a uma acomodação ou hospedagem, o tranporte até esse local e o retorno.");
  } 
  if(quantidadeHoras > 4) {
    textoRetorno = _addToString(textoRetorno, "Você tem direito a remarcação de voo ou o reembolso integral da passagem");
  }

  return textoRetorno;
}

String _addToString(String texto, String adicionar) {
  if(texto == "") {
    return adicionar;
  } else {
    texto += "\n $adicionar";
    return texto;
  }
}

//calcula o tempo de uma futura viagem, a partir da sua distancia (kmPercurso), media de km por hora e os tempos de paradas
double calculaTempoViagem({required double kmPercurso, required double mediaKmPorHora, double tempoParadasEmMinutos = 0, double intervaloEntreParadasEmMinutos = 0}){
  double tempoDistancia = kmPercurso / mediaKmPorHora;
  double tempoDistanciaMinutos = tempoDistancia * 60;
  double tempoFinal = tempoDistanciaMinutos;
  if(tempoParadasEmMinutos != 0 && intervaloEntreParadasEmMinutos != 0) {
    double quantidadeParadas = 0;
    for(double tempo = tempoFinal; tempo > intervaloEntreParadasEmMinutos ; tempo -= intervaloEntreParadasEmMinutos) {
      quantidadeParadas++;
    }
    tempoFinal = tempoFinal + (tempoParadasEmMinutos * quantidadeParadas);
  }

  return tempoFinal;
}

//Calcula a quantidade em lros de combustivel necessario para a viagem, possuindo como informação necessaria o percurso em km
//possibilita informar tambem a quilometragem de seu veiculo por litro de cada tipo de combustivel, bem como o preço de ambos, para fornecer
//informações dos gastos em moeda 
Object calcularLitrosCombustivel({
  required double percursoEmKM, 
  double kmPorLitroGasolina = 0, 
  double precoGasolina = 0,
  double kmPorLitroAlcool = 0,
  double precoAlcool = 0
}) {
  _checkNegativeValue(percursoEmKM);
  _checkNegativeValue(kmPorLitroGasolina);
  _checkNegativeValue(precoGasolina);
  _checkNegativeValue(kmPorLitroAlcool);
  _checkNegativeValue(precoAlcool);

  double litrosGasolinaNecessario = 0;
  double litrosAlcoolNecessario = 0;
  double valorGasolinaNecessario = 0;
  double valorAlcoolNecessario = 0;

  if(kmPorLitroGasolina == 0 && kmPorLitroAlcool == 0) {
    throw Exception('Voce deve informar a quilometragem por litro do seu veiculo para que seja possivel realizar um calculo aproximado');
  }

  if(kmPorLitroGasolina != 0) {
    litrosGasolinaNecessario = _calcularLitros(percursoEmKM, kmPorLitroGasolina);
  }
  if(kmPorLitroAlcool != 0) {
    litrosAlcoolNecessario = _calcularLitros(percursoEmKM, kmPorLitroAlcool);
  }
  
  if(litrosGasolinaNecessario != 0) {
    valorGasolinaNecessario = litrosGasolinaNecessario * precoGasolina;
  }
  if(litrosAlcoolNecessario != 0) {
    valorAlcoolNecessario = litrosAlcoolNecessario * precoAlcool;
  }

  return  {
    litrosGasolinaNecessario,
    litrosAlcoolNecessario,
    valorGasolinaNecessario,
    valorAlcoolNecessario
  };
}


//Converter horas, recebe como parametro uma data informada e UTC informado
//converte a data informada para uma data de acordo com o utc informado
//caso o parametro data não seja informado, pois não é obrigatorio, será utilizado o horario atual
//a data sera convertida para UTC, para realizar o calculo
DateTime converterHoras({DateTime? data, required int utcValueLocal}) {
    // ignore: prefer_conditional_assignment
    if(data == null) {
      data = DateTime.now();
    }
    DateTime dataToUtc = data.toUtc();
    Duration duration = Duration(hours: utcValueLocal);
    return dataToUtc.add(duration);
}

//Converter cambio, recebe como parametro o valor da moeda que quer converter e a taxa da moeda que deseja converte-la
//converte a moeda informada para a uma outra moeda a partir de sua taxa cambial
Object converterCambio({required double valorMoeda, required double cotacaoMoedaDestino, double percentualTaxa = 0}) {
  double conversaoMoeda = valorMoeda * cotacaoMoedaDestino;
  double valorTaxa = 0;
  if(percentualTaxa != 0) {
    valorTaxa = conversaoMoeda * (percentualTaxa / 100);
  }
  double valorFinalAcessivel = conversaoMoeda - valorTaxa; 
  return {
    conversaoMoeda,
    valorFinalAcessivel,
    valorTaxa,
  };
}

//Funções UTIL do arquivo
void _checkNegativeValue(double value) {
    if(value < 0){
        throw Exception('Numero negativo é inválido');
    }
}

double _calcularLitros(double percurso, double kmPorLitro) {
  return percurso / kmPorLitro;
}