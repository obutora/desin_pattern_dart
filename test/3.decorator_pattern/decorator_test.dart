import 'package:design_pattern_dart/3.decorator_pattern/decorator.dart';
import 'package:test/test.dart';

void main() {
  test('decorator pattern', () {
    Ramen ramen1 = ShoyuRamen();
    expect(ramen1.getDescription(), '醤油ラーメン');
    expect(ramen1.cost(), 500);

    ramen1 = ChashuOption(ramen1); // cost: 500 + 200 = 700
    ramen1 = NoriOption(ramen1); // cost: 700 + 100 = 800
    expect(ramen1.getDescription(), '醤油ラーメン + チャーシュー + のり');
    expect(ramen1.cost(), 800);

    Ramen ramen3 = ShoyuRamen();
    ramen3 = ChashuOption(ramen3);
    ramen3 = ChashuOption(ramen3);
    ramen3 = ChashuOption(ramen3);

    expect(ramen3.getDescription(), '醤油ラーメン + チャーシュー + チャーシュー + チャーシュー');

    // 同じ抽象ラーメンクラスを継承したデコレータを用いて
    // ラーメンクラスは、どのデコレータをどの組み合わせでも、何回でも、
    // 足し合わせることができる
  });
}
