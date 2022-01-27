import 'package:test/test.dart';
import '../challenge_one.dart';

main() {
  test('Should not accept non-numeric input', () {
    final int result = validateInput('a');
    expect(result, -1);
  });


  test('Should not accept negative number', () {
    final int result = validateInput('-3');
    expect(result, -1);
  });

  test('Should return the greatest divisible number by 3 less then or equal 99', () {
    final int result = lastTermOfProgression(3, 99);
    expect(result, 96);
  });

  test('Should return the greatest divisible number by 3 less then or equal 100', () {
    final int result = lastTermOfProgression(3, 100);
    expect(result, 99);
  });

  test('Should return the greatest divisible number by 5 less then or equal 99', () {
    final int result = lastTermOfProgression(5, 99);
    expect(result, 95);
  });

  test('Should return the greatest divisible number by 5 less then or equal 105', () {
    final int result = lastTermOfProgression(5, 105);
    expect(result, 100);
  });

  test('Should return the greatest divisible number by 15 less then or equal 90', () {
    final int result = lastTermOfProgression(15, 90);
    expect(result, 75);
  });

  test('Should return the greatest divisible number by 15 less then or equal 89', () {
    final int result = lastTermOfProgression(15, 89);
    expect(result, 75);
  });

  test('Should return the greatest divisible number by 15 less then or equal 100', () {
    final int result = lastTermOfProgression(15, 100);
    expect(result, 90);
  });

  test('Should return the greatest divisible number by 15 less then or equal 100', () {
    final num result = numberOfProgressionTerms(3, 99);
    expect(result, 33);
  });

  test('Should return the greatest divisible number by 15 less then or equal 100', () {
    final num result = numberOfProgressionTerms(5, 95);
    expect(result, 19);
  });

  test('Should return the greatest divisible number by 15 less then or equal 100', () {
    final num result = numberOfProgressionTerms(15, 90);
    expect(result, 6);
  });

  test('Should return the arithmetic series of difference 3 and max term 10', () {
    final lastTerm = lastTermOfProgression(3, 10);
    final numberOfTerms = numberOfProgressionTerms(3, lastTerm);
    final num result = sumOfProgression(3, numberOfTerms, lastTerm);

    expect(result, 18);
  });

  test('Should return the arithmetic series of difference 5 and max term 10', () {
    final lastTerm = lastTermOfProgression(5, 10);
    final numberOfTerms = numberOfProgressionTerms(5, lastTerm);
    final num result = sumOfProgression(5, numberOfTerms, lastTerm);

    expect(result, 5);
  });

  test('Should return the arithmetic series of difference 15 and max term 10', () {
    final lastTerm = lastTermOfProgression(15, 10);
    // print(lastTerm);
    final numberOfTerms = numberOfProgressionTerms(15, lastTerm);
    // print(numberOfTerms);
    final num result = sumOfProgression(15, numberOfTerms, lastTerm);

    expect(result, 0);
  });

  test('Should return the final result of integer 10', () {
    final maxNumber = 10;
    final sumOfDivisiblesBy5 = sumOfDivisibles(5, maxNumber);
    final sumOfDivisiblesBy3 = sumOfDivisibles(3, maxNumber);
    final sumOfDivisiblesBy15 = sumOfDivisibles(15, maxNumber);

    expect(sumOfDivisiblesBy5+sumOfDivisiblesBy3-sumOfDivisiblesBy15, 23);
  });

  test('Should return the final result of integer 11', () {
    final maxNumber = 11;
    final sumOfDivisiblesBy5 = sumOfDivisibles(5, maxNumber);
    final sumOfDivisiblesBy3 = sumOfDivisibles(3, maxNumber);
    final sumOfDivisiblesBy15 = sumOfDivisibles(15, maxNumber);

    expect(sumOfDivisiblesBy5+sumOfDivisiblesBy3-sumOfDivisiblesBy15, 33);
  });

  test('Should return the final result of integer 30', () {
    final maxNumber = 31;
    final sumOfDivisiblesBy5 = sumOfDivisibles(5, maxNumber);
    final sumOfDivisiblesBy3 = sumOfDivisibles(3, maxNumber);
    final sumOfDivisiblesBy15 = sumOfDivisibles(15, maxNumber);

    expect(sumOfDivisiblesBy5+sumOfDivisiblesBy3-sumOfDivisiblesBy15, 225);
  });
}
