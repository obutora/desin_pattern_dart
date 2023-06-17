// decoratorパターンでは、まずすべての元になる抽象コンポーネントクラスを定義する
abstract class Ramen {
  String description = '';
  String getDescription();
  int cost();
}

// 次にコンポーネントを修飾するために、抽象コンポーネントクラスを拡張した
// 抽象デコレータクラスを定義する
abstract class RamenDecorator extends Ramen {
  Ramen ramen;
  RamenDecorator(this.ramen);
}

// 次に、抽象コンポーネントクラスを拡張した各ラーメンクラスを定義する
class ShoyuRamen extends Ramen {
  ShoyuRamen() {
    description = '醤油ラーメン';
  }

  @override
  String getDescription() {
    return description;
  }

  @override
  int cost() {
    return 500;
  }
}

class MisoRamen extends Ramen {
  MisoRamen() {
    description = '味噌ラーメン';
  }

  @override
  String getDescription() {
    return description;
  }

  @override
  int cost() {
    return 600;
  }
}

// 抽象デコレータクラスを拡張したオプションクラスを定義する
// このクラスは、抽象デコレータクラスを拡張しているので、
// コンストラクタで渡されたコンポーネントクラスを保持し、
// 機能をつけ加えることができる
class ChashuOption extends RamenDecorator {
  ChashuOption(Ramen ramen) : super(ramen);

  @override
  String getDescription() {
    return '${ramen.getDescription()} + チャーシュー';
  }

  @override
  int cost() {
    return ramen.cost() + 200;
  }
}

class NoriOption extends RamenDecorator {
  NoriOption(Ramen ramen) : super(ramen);

  @override
  String getDescription() {
    return '${ramen.getDescription()} + のり';
  }

  @override
  int cost() {
    return ramen.cost() + 100;
  }
}
