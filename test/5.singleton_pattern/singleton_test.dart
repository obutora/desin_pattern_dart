import 'package:design_pattern_dart/5.singleton_pattern/singleton_pattern.dart';
import 'package:test/test.dart';

void main() {
  test('singleton pattern', () {
    final singleton = Singleton();
    singleton.setName('name1');

    expect(singleton.getName(), 'name1');

    // 2つ目のインスタンスを宣言しているように見えるが、
    // 1つ目と全く同じインスタンスが返ってきている
    final singleton2 = Singleton();
    expect(singleton2.getName(), 'name1');
  });
}
