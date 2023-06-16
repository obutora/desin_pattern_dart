import 'package:design_pattern_dart/1.strategy_pattern/strategy.dart';
import 'package:test/test.dart';

void main() {
  test('Strategy Pattern', () {
    final jpCalc = CalcMoney(calcStrategy: JapaneseCalcMonyStrategy());
    final usaCalc = CalcMoney(calcStrategy: USACalcMonyStrategy());

    expect(jpCalc.calc(100), 100);
    expect(usaCalc.calc(100), 14000);
  });
}
