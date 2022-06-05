void main() {
  // Atividade II → Realize as atividades abaixo
  double salario = 2000;
  double valor = 200;

  //Exercício 1 - faça a chamada do método adicionarSalario validando se o valor é positivo.
  adicionarSalario(salario, valor, validacaoSalario);

  //Exercício 2 - refaça o exe anterior, convertendo a named function em anonymous function.
  adicionarSalario(salario, valor, (valor) {
    if (valor > 0) return true;
    return false;
  });

  //Exercício 3  - refaça o exe anterior, utilizando a arrow function.
  adicionarSalario(salario, valor, (valor) => valor > 0 ? true : false);

  //Exercício 4  - refaça os exe's a, b e c, porém validando se o valor é menor do que o salário.
  adicionarSalario(salario, valor, (valor) {
    if (valor < salario) return true;
    return false;
  });

  //Exercício 5  - refaça o exe c porém fazendo uma validação sua.
  //verificar se o valor é menor que 15% do salario, se for, é valido
  adicionarSalario(salario, valor, (valor) {
    double percentual = 15;
    double percentualDoSalario = salario * (percentual / 100);
    if (valor < percentualDoSalario) {
      return true;
    } else {
      return false;
    }
  });

  //Exercício 6 - faça 2 exemplos do uso de funções anônimas utilizando a biblioteca do dart.
  List<String> nomes = [
    'Joao Antonio',
    'Cristhian da Silveira Maia',
    'Jhonatan Antonio',
    'Helio Kamakawa'
  ];
  //função anonima para mostrar nomes que começam com J
  nomes.forEach((nome) {
    if (nome.startsWith("J")) print(nome);
  });

  //Função anonima que preenche uma lista (apenasPrimeiroNome) com apenas o primeiro nome da lista de nomes
  List<String> apenasPrimeiroNome = nomes.map((nome) {
    final indexSpace = nome.indexOf(' ');
    print(indexSpace);
    if (indexSpace != -1) {
      return nome.substring(0, indexSpace);
    }
    return nome;
  }).toList();

  apenasPrimeiroNome.forEach(print);

  /*
  Exercício 6 - Conseguiu entender:
    - O contexto em que é útil utilizar funções anônimas?
    Quando é necessario 
    - Os requisitos necessários para usar funções anônimas? 

    - diferença entre função nomeada e anônimas?
    Uma função nomeada normalmente é definida em um escopo onde pode ser reutilizada, sempre que necessaria, logo essa função deve ser implementada (ou não) de maneira dinamica, para tratar dados independente da forma que receber
    Diferentemente de uma função anonima que não pode ser reutilizadas, normalmente deve ser utilizada para implementar funções especificas no momento que está sendo definida
    - diferença entre anonymous function e arrow function?
    Em que caso devemos utilizar Arrow Function? O que devemos considerar?
  */
}

void adicionarSalario(
    double salario, double valor, Function(double valor) validacao) {
  final eValido = validacao(valor);
  if (eValido) {
    final total = salario + valor;
    print(total);
  }
}

bool ePositivo(int numero) {
  if (numero > 0) {
    return true;
  } else {
    return false;
  }
}

bool validacaoSalario(double valor) {
  if (valor > 0) return true;
  return false;
}
