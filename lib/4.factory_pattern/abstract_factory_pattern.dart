// abstract factory patternでは、
// 抽象Factoryクラスを定義する。
// このクラスは、生成する製品の抽象クラスを生成するメソッドを持ち、
// 結果として抽象クラスのコンポジションをもつ。
abstract class CofeeAbstractFactory {
  Espresso createEspresso();
  Cappuccino createCappuccino();
}

// 抽象Factoryクラスを構成する製品の抽象クラス
abstract class Espresso {
  late String name;
  Espresso createEspresso();
}

abstract class Cappuccino {
  late String name;
  Cappuccino createCappuccino();
}

// 製品の実装クラス
// 具体的なインスタンスの生成はここで行われる
class JapaneseEspresso implements Espresso {
  @override
  late String name;

  JapaneseEspresso({this.name = 'JapaneseEspresso'});

  @override
  Espresso createEspresso() {
    return JapaneseEspresso();
  }
}

class ItalianEspresso implements Espresso {
  @override
  late String name;

  ItalianEspresso({this.name = 'ItalianEspresso'});

  @override
  Espresso createEspresso() {
    return ItalianEspresso();
  }
}

class ItalianCappuccino implements Cappuccino {
  @override
  late String name;

  ItalianCappuccino({this.name = 'ItalianCappuccino'});

  @override
  Cappuccino createCappuccino() {
    return ItalianCappuccino();
  }
}

class JapaneseCappuccino implements Cappuccino {
  @override
  late String name;

  JapaneseCappuccino({this.name = 'JapaneseCappuccino'});

  @override
  Cappuccino createCappuccino() {
    return JapaneseCappuccino();
  }
}

// 抽象Factoryクラスを実装するクラス
// コンポジションを上手くつかって、具象製品クラスの生成メソッドを呼び出す
class JapaneseCofeeeAbstractFactory implements CofeeAbstractFactory {
  @override
  Espresso createEspresso() {
    return JapaneseEspresso();
  }

  @override
  Cappuccino createCappuccino() {
    return JapaneseCappuccino();
  }
}

class ItalianCofeeeAbstractFactory implements CofeeAbstractFactory {
  @override
  Espresso createEspresso() {
    return ItalianEspresso();
  }

  @override
  Cappuccino createCappuccino() {
    return ItalianCappuccino();
  }
}
