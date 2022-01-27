import 'dart:io';

// para retornar o somatorio dos numeros, primeiro temos que descobrir
// quais sao os numeros divisiveis por 3 e depois por 5
// depois de ter essas sequencias o resultado
// eh a soma dos somatorios das duas sequencias, subtraindo os valores que repetiram
// -----------------------------------------------------------------------
// to get the sum of all numbers, first we need to find  all divisible numbers
// by 3 and 5, with these sequences, to get the result we just sum the sums of progressions
// subtracting the members that repeated

/// valida o inpuit do usuario: retorna -1 se nao for um inteiro positivo
/// retorna o input como inteiro caso contrario.
/// -----------------------------------------------------------------------
/// validates the user input: return -1 if input is not a positive integer
/// return input as integer otherwise
int validateInput(dynamic input) {
  final result = int.tryParse(input);
  if (result == null || result.isNegative == true) return -1;

  return result;
}

/// dado um numero maximo: 20
/// temos a seguinte sequencia de divisiveis por 3: 3, 6, 9, 12, 15, 18.
/// conseguimos ver que o ultimo termo da sequencia eh o maior numero
/// divisivel por 3 e menor que o numero maximo.
/// -----------------------------------------------------------------------
/// given a max number: 20
/// we got the following sequence of number divisible by 3: 3, 6, 9, 12, 15, 18.
/// we can see that the last term is the greatest number less than 20.
int lastTermOfProgression(int commonDiferrence, int maxNumber) {
  // greatest divisible number less then maxNumber
  final dividend = maxNumber - 1;
  final reminder = dividend % commonDiferrence;

  return dividend - reminder;
}

/// com o ultimo termo e a razao da progressao, conseguimos encontrar
/// a quantidade de termos da sequencia.
/// colocando a razao em evidencia na sequencia anterior, temos: 3(1, 2, 3, 4, 5, 6)
/// vemos que a quantidade de termos eh o ultimo termo dividido pela razao.
/// -----------------------------------------------------------------------
/// as we can see: 3(1, 2, 3, 4, 5, 6) = 3, 6, 9, 12, 15, 18
/// with the last member of the arithmetic sequence, we can find the number of terms
/// by dividing the last member by the common difference.
int numberOfProgressionTerms(int commonDiferrence, int lastTerm) {
  return lastTerm ~/ commonDiferrence;
}

/// para calcular a soma dos termos de uma sequencia, usamos a seguinte formula:
/// n(a1 + a2)/2
/// -----------------------------------------------------------------------
/// to calculate the sum of the members of a sequence, we use the following formula:
/// n(a1 + a2)/2
int sumOfProgression(int commonDiferrence, int nthTerm, int lastTerm) {
  final firstTerm = 0;
  final numberOfTerms = nthTerm + 1;

  return numberOfTerms * (firstTerm + lastTerm) ~/ 2;
}

/// dado um um divisor (razao) e um numero maximo, conseguimos calcular
/// todos os numeros divisiveis e menores que o numero maximo.
/// -----------------------------------------------------------------------
/// given an divisor (common difference) and a max number, we can calculate
/// all divisible numbers less then max number.
int sumOfDivisibles(int commonDifference, int maxNumber) {
  final lastTerm = lastTermOfProgression(commonDifference, maxNumber);
  final numberOfTerms = numberOfProgressionTerms(commonDifference, lastTerm);

  return sumOfProgression(commonDifference, numberOfTerms, lastTerm);
}

void main() {
  stdout.write('Insira um número inteiro positivo: ');
  var number = stdin.readLineSync();
  final maxNumber = validateInput(number);

  if (maxNumber == -1) {
    return print('Número inválido. Insira um inteiro positivo.');
  } else {
    final sumOfDivisiblesBy3 = sumOfDivisibles(3, maxNumber);
    final sumOfDivisiblesBy5 = sumOfDivisibles(5, maxNumber);
    final sumOfDivisiblesBy15 = sumOfDivisibles(15, maxNumber);
    // para calcular todos os divisiveis, somamos a somatoria da razao 3 e 5
    // e subtraimos os numeros que repetiram (multiplos de 15)
    // ----------------------------------------------------------------------
    // to calculate all divisible numbers, we sum the sum of progressions
    // of common difference 3 and 5, subtracting all repeating members (multiples of 15)
    final result = sumOfDivisiblesBy3 + sumOfDivisiblesBy5 - sumOfDivisiblesBy15;

    print('Resultado: $result');
  }
}
