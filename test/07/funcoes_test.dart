import 'package:funcoes/07/funcoes.dart';
import 'package:test/test.dart';

void main() {
  group('Calculo custo viagem veiculo - calcularCustoCombustivelViagemVeiculoProprio', (){
    double quilometragemInicial = 237;
    double quilometragemFinal = 337;
    double consumoPorLitro = 10;
    double precoLitro = 7;
    double litrosAbastecidos = 100;


    test('Validação calculo', () {
      expect(
        calcularCustoVeiculoNaViagem(
          quilometragemInicial: quilometragemInicial, 
          quilometragemFinal: quilometragemFinal,
          consumoPorLitro: consumoPorLitro,
          litrosAbastecidos: litrosAbastecidos,
          precoPorLitro: precoLitro
        ),
        {70: 70, 10: 10, 90: 90}
      );
    });

    test('exceção inicial e final resultando em negativo', (){
      expect(
        () => calcularCustoVeiculoNaViagem(
          quilometragemInicial: 500, 
          quilometragemFinal: 400,
          consumoPorLitro: consumoPorLitro,
          litrosAbastecidos: litrosAbastecidos,
          precoPorLitro: precoLitro
        ),
        throwsException
      );
    });
    test('exceção parametro consumoPorlitro negativo', (){
      expect(
        () => calcularCustoVeiculoNaViagem(
          quilometragemInicial: quilometragemInicial, 
          quilometragemFinal: quilometragemFinal,
          consumoPorLitro: -200,
          litrosAbastecidos: litrosAbastecidos,
          precoPorLitro: precoLitro
        ),
        throwsException
      );
    });
    test('exceção parametro consumoPorlitro negativo', (){
      expect(
        () => calcularCustoVeiculoNaViagem(
          quilometragemInicial: quilometragemInicial, 
          quilometragemFinal: quilometragemFinal,
          consumoPorLitro: consumoPorLitro,
          litrosAbastecidos: litrosAbastecidos,
          precoPorLitro: -5.67
        ),
        throwsException
      );
    });
  });

  group("Verifica os paises que ja retornou a partir de um conjunto de caracteres; retornaPaisesViajadosPorBusca", (){
    test("validando resultado esperado", (){
      expect(retornaPaisesViajadosPorBusca(["França", "Espanha", "Estados Unidos", "China"], "Fran"), ['França']);
    });
    test("validando retorno de todas as viagens", (){
      expect(retornaPaisesViajadosPorBusca(["França", "Espanha", "Estados Unidos", "China"], ""), ["França", "Espanha", "Estados Unidos", "China"]);
    });
    test("validando retorno de todas as viagens com espaços na busca", (){
      expect(retornaPaisesViajadosPorBusca(["França", "Espanha", "Estados Unidos", "China"], "  "), ["França", "Espanha", "Estados Unidos", "China"]);
    });
    test("validando resultado da busca pelo caractere i", (){
      expect(retornaPaisesViajadosPorBusca(["França", "Espanha", "Estados Unidos", "China"], "i"), ['Estados Unidos', 'China']);
    });
    test("validando resultado quando não encontrado", (){
      expect(() => retornaPaisesViajadosPorBusca(["França", "Espanha", "Estados Unidos", "China"], "Brasil"), throwsException);
    });
    test("validando resultado quando se busca algo invalido", (){
      expect(() => retornaPaisesViajadosPorBusca(["França", "Espanha", "Estados Unidos", "China"], "1233333"), throwsException);
    });
  });

  group('Converter escala temperatura - converterEscalaTemperatura', () {
    test('resultado esperado celsius para fahrenheit', () {
      expect(converterEscalaTemperatura(grau: 0, converterDe: "celsius", converterPara: "fahrenheit"), 32);
    });

    test('resultado esperado fahrenheit para celsius', () {
      expect(converterEscalaTemperatura(grau: 32, converterDe: "fahrenheit", converterPara: "celsius"), 0);
    });

    test('informando parametro converterDe incorreto', () {
      expect(
        () => converterEscalaTemperatura(grau: 50, converterDe: "fahrenenenene", converterPara: "celsius"), 
        throwsException
      );
    });

    test('informando parametro converterPara incorreto', () {
      expect(
        () => converterEscalaTemperatura(grau: 10, converterDe: "fahrenheit", converterPara: "cleusisii"), 
        throwsException
      );
    });
  });

  group("aplica o cupom no valor da viagem informado; aplicarCupomViagem", (){
    test("validando resultado esperado", (){
      expect(aplicarCupomViagem(valorDaViagem: 1200, cupomInserido: "CUPOM15"), 1020);
    });

    test("validando resultado com cupom invalido", (){
      expect(() => aplicarCupomViagem(valorDaViagem: 1200, cupomInserido: "CUPOMBOASFESTAS"), throwsException);
    });
  });

  group("Calcula as diarias no hotel, incluindo taxas; calcularDiariasHotel", (){
    test("validando resultado esperado", (){
      expect(calcularDiariasHotel(valorDiaria: 200, quantidadeDiaria: 10), 2100);
    });
  });

  group("Consulta sobre atrasos do aviao; informarAtrasoAviao", (){
    test("validando resultado esperado para meia hora", (){
      expect(informarAtrasoAviao(0.5), "Você ainda não possui direitos relacionados à atrasos");
    });
    test("validando resultado esperado para duas horas", (){
      expect(informarAtrasoAviao(2), "Você tem direito a internet e ligações gratuitas.\n Você tem direito a alimentação da empresa, por meio de lanches, bebidas ou vouchers.");
    });
  });

  group("Calcular tempo da viagem; calculaTempoViagem", (){
    test("calcula tempo viagem sem paradas", (){
      expect(calculaTempoViagem(kmPercurso: 200, mediaKmPorHora: 40), 300);
    });
    test("calcula tempo viagem com paradas", (){
      expect(calculaTempoViagem(kmPercurso: 200, mediaKmPorHora: 40, tempoParadasEmMinutos: 15, intervaloEntreParadasEmMinutos: 60), 360);
    });
  });

  group("Calcular litros combustivel; calcularLitrosCombustivel", () {
    test('validando resultado esperado', (){
      expect(calcularLitrosCombustivel(percursoEmKM: 100, kmPorLitroGasolina: 20), {5, 0});
    });
    test('validando resultado esperado, esperando tambem valor da gasolina que sera gasta', (){
      expect(calcularLitrosCombustivel(percursoEmKM: 100, kmPorLitroGasolina: 20, precoGasolina: 5), {5, 0, 25});
    });
    test('Informando valor negativo', (){
      expect(() => calcularLitrosCombustivel(percursoEmKM: -100, kmPorLitroGasolina: 20, precoGasolina: 5), throwsException);
    });
  });

  group('Conversão de horas, converterHoras', (){
    test('Validando alteração horas', () {
      expect(converterHoras(data: DateTime.parse("1969-07-20 02:18:04Z").toLocal(), utcValueLocal: 4), DateTime.parse("1969-07-20 06:18:04Z"));
    });

    test('Validando alteração horas utc negativo', () {
      expect(converterHoras(data: DateTime.parse("1969-07-20 02:18:04Z").toLocal(), utcValueLocal: -4), DateTime.parse("1969-07-19 22:18:04Z"));
    });

    test('Validando alteração horas sem informar o parametro data', () {
      int utcValueLocal = 4;
      DateTime dataAtual = DateTime.now().toUtc().add(Duration(hours: utcValueLocal));
      expect(converterHoras(utcValueLocal: utcValueLocal), (DateTime result) => result.hour == dataAtual.hour);
    });
  });

  group("Converter cambio", (){
    test('validando resultado esperado, de dolar para reais (Quero 50 dolares, quanto custará em reais?', (){
      expect(converterCambio(valorMoeda: 50, cotacaoMoedaDestino: 4.78), {239, 0});
    });

    test('validando resultado esperado, incluindo o percentual da taxa de conversão', (){
      expect(converterCambio(valorMoeda: 50, cotacaoMoedaDestino: 4.78, percentualTaxa: 2), {234.22, 239, 4.78});
    });
  });

}

