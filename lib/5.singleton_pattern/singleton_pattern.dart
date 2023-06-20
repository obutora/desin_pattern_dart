class Singleton {
  static String name = '';

  // dartでは_ で始まる変数はprivateになる
  // この場合、Singleton class のコンストラクタをprivateにすることで
  // インスタンスの生成をクラス内からのみに制限している
  Singleton._();

  // コンストラクタに外部からアクセスできないため、
  // factory constructorを用いて、インスタンスを生成する
  factory Singleton() {
    return Singleton._();
  }

  getName() {
    return name;
  }

  setName(String name) {
    Singleton.name = name;
  }
}
