import '../1.strategy_pattern/strategy.dart';

class Point {
  final int point;
  final double rate;

  Point({required this.point, required this.rate});
}

// strategy patternで利用したCalcMoneyStrategyInterfaceに適合させるためのアダプタを作成する
class PointAdapter implements CalcMoneyStrategyInterface {
  final Point point;

  PointAdapter(this.point);

  @override
  int calc(int? _) {
    return (point.point * point.rate).toInt();
  }
}
