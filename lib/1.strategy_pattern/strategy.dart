// 各Strategyに実装されるInterface
// このInterfaceを実装することで、Strategyの切り替えが可能になる
abstract class CalcMoneyStrategyInterface {
  int calc(int money);
}

// Strategyの中身を実装するクラス1
class JapaneseCalcMonyStrategy implements CalcMoneyStrategyInterface {
  @override
  int calc(int money) {
    return money;
  }
}

// Strategyの中身を実装するクラス2
// たくさんのパターンを実装する場合、このようにクラスを増やしていくことができる
class USACalcMonyStrategy implements CalcMoneyStrategyInterface {
  @override
  int calc(int money) {
    return (money * 140).toInt();
  }
}

// Strategyを使うクラス
// インスタンスの生成時にStrategyを渡すことで、
// 複雑な分岐を避けながらアルゴリズムを切り替えることができる
// 重要なのは、Interfaceを実装したStrategyで「構成」されており、
// このクラス自体はInterfaceを継承しているわけではない。
// Strategyの切り替えが不要な共通処理は、継承によって表現することもできる。
class CalcMoney {
  final CalcMoneyStrategyInterface calcStrategy;

  CalcMoney({required this.calcStrategy});

  int calc(int money) {
    return calcStrategy.calc(money);
  }
}
