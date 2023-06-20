// factory patternでは、生産者を抽象クラスとして定義し、
// 製品を生成するメソッドを持つ
// このメソッドをファクトリメソッドと呼ぶ
// abstract factoryと異なり、継承を利用しているのが特徴。
// どの具象クラスのインスタンスを生成するかサブクラスに任せる。
abstract class CofeeFactory {
  Cofee createCofee();
}

// Factoryの実装クラスは、
// 抽象Factoryクラスを拡張し、
// 製品の具体的な生成メソッドを実装する
// これによって、実行時に呼び出しする際に、どのFactoryを呼び出すかによって
// 生成される製品を変更することができる。
class StarCofeeFactory extends CofeeFactory {
  @override
  Cofee createCofee() {
    return StarCofee();
  }
}

class StarEspressoFactory extends CofeeFactory {
  @override
  Cofee createCofee() {
    return StarEspresso();
  }
}

// 製品の抽象クラス
abstract class Cofee {
  String description = '';
  String getDescription();
}

// 製品の具体クラス
// 生産者の実装クラスで生成される製品を定義する。
// 製品の抽象クラスに沿ってさえいれば、どの製品を生成するかを自由に決められる
class StarCofee extends Cofee {
  StarCofee() {
    description = 'スターコーヒー';
  }

  @override
  String getDescription() {
    return description;
  }
}

class StarEspresso extends Cofee {
  StarEspresso() {
    description = 'スターエスプレッソ';
  }

  @override
  String getDescription() {
    return description;
  }
}
