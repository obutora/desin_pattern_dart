import 'package:design_pattern_dart/7.adapter_and_facade_pattern/adapter_pattern.dart';
import 'package:test/test.dart';

void main() {
  test('adapter test', () {
    //pointクラスはCalcMoneyStrategyを知らず、calcメソッドも持っていない
    final point = Point(point: 100, rate: 0.1);

    // pointクラスをCalcMoneyStrategyに適合させるためのアダプタを作成する
    final adoptPoint = PointAdapter(point);

    // PointAdapterはCalcMoneyStrategyを知っており、
    // calcメソッドを持っているため、金額の計算が可能
    final calcMoney = adoptPoint.calc(null);
    expect(calcMoney, 10);
  });
}
