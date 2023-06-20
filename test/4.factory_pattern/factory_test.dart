import 'package:design_pattern_dart/4.factory_pattern/factory_method_pattern.dart';
import 'package:test/test.dart';

void main() {
  group('factory pattern', () {
    test('factory method pattern', () {
      final CofeeFactory starCofeeFactory = StarCofeeFactory();
      final Cofee starCofee = starCofeeFactory.createCofee();

      expect(starCofee.getDescription(), 'スターコーヒー');

      final CofeeFactory starEspressoFactory = StarEspressoFactory();
      final Cofee starEspresso = starEspressoFactory.createCofee();
      expect(starEspresso.getDescription(), 'スターエスプレッソ');
    });

    test('abstract factory pattern', (() {
      final CofeeAbstractFactory japaneseCofeeFactory =
          JapaneseCofeeeAbstractFactory();
      final Espresso japaneseEspresso = japaneseCofeeFactory.createEspresso();
      final Cappuccino japaneseCappuccino =
          japaneseCofeeFactory.createCappuccino();

      expect(japaneseEspresso.name, 'JapaneseEspresso');
      expect(japaneseCappuccino.name, 'JapaneseCappuccino');

      final CofeeAbstractFactory italianCofeeFactory =
          ItalianCofeeeAbstractFactory();
      final Espresso italianEspresso = italianCofeeFactory.createEspresso();
      final Cappuccino italianCappuccino =
          italianCofeeFactory.createCappuccino();

      expect(italianEspresso.name, 'ItalianEspresso');
      expect(italianCappuccino.name, 'ItalianCappuccino');
    }));
  });
}
