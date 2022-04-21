String verificarAprovacaoCompleto(int opcao, double nota1, double nota2) {
  if (opcao == 1) {
    //aprovação pela media
    double media = (nota1 + nota2) / 2;
    if (media >= 6) {
      return 'aprovado';
    } else {
      return 'reprovado';
    }
  } else if (opcao == 2) {
    //aprovação pela maior nota
    double maior = nota1;
    if (nota2 > nota1) {
      maior = nota2;
    }
    if (maior >= 6) {
      return 'aprovado';
    } else {
      return 'reprovado';
    }
  } else {
    //aprovação pela menor nota
    double menor = nota1;
    if (nota2 < nota1) {
      menor = nota2;
    }
    if (menor >= 6) {
      return 'aprovado';
    } else {
      return 'reprovado';
    }
  }
}

void show() {
  int opcao = 1;
  double nota1 = 1;
  double nota2 = 1;
  if (opcao == 1) {
    verificarAprovacao(nota1, nota2, verificarPelaMedia);
  } else if (opcao == 2) {
    verificarAprovacao(nota1, nota2, verificarPelaMaiorNota);
  } else {
    verificarAprovacao(nota1, nota2, verificarPelaMenorNota);
  }
}

String verificarAprovacao(double nota1, double nota2, Function acao) {
  return acao(nota1, nota2);
}

String verificarPelaMedia(double nota1, double nota2) {
  double media = (nota1 + nota2) / 2;
  return validarAprovacao(media, 6);
}

String verificarPelaMaiorNota(double nota1, double nota2) {
  double maior = nota1;
  if (nota2 > nota1) {
    maior = nota2;
  }
  return validarAprovacao(maior, 6);
}

String verificarPelaMenorNota(double nota1, double nota2) {
  double menor = nota1;
  if (nota2 < nota1) {
    menor = nota2;
  }
  return validarAprovacao(menor, 6);
}

String validarAprovacao(double nota, double notaMinima) {
  if (nota >= notaMinima) {
    return 'aprovado';
  } else {
    return 'reprovado';
  }
}
