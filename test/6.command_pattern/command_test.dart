import 'package:design_pattern_dart/6.command_pattern/command_pattern.dart';
import 'package:test/test.dart';

void main() {
  test('command pattern', () {
    Invoker invoker = Invoker();

    Light light = LEDLight();
    LightCommand ledLightCommand = LightCommand(light);
    invoker.setCommand(ledLightCommand);
    final res = invoker.excute();
    expect(res, 'LED Light on');

    Light candleLight = CandleLight();
    Command candleLightCommand = LightCommand(candleLight);
    invoker.setCommand(candleLightCommand);
    final res2 = invoker.excute();
    expect(res2, 'Candle Light on');

    final res2_2 = invoker.undo();
    expect(res2_2, 'Candle Light off');

    AirConditioner airConditioner = AirConditioner();
    Command airConditionerCommand = AirConditionerOnCommand(airConditioner);
    invoker.setCommand(airConditionerCommand);
    final res3 = invoker.excute();
    expect(res3, 'AirConditioner on');

    Command airConditionerDownCommand =
        AirConditionerDownCommand(airConditioner);
    invoker.setCommand(airConditionerDownCommand);

    Command macro = MacroCommand([
      ledLightCommand,
      candleLightCommand,
      airConditionerCommand,
      airConditionerDownCommand,
    ]);

    print(macro.execute());
    expect(macro.execute(), '''LED Light on
Candle Light on
AirConditioner on
AirConditioner down
''');

    // Boss bossA = Boss.fromName('bossA');
    // bossA.excute();

    // Boss bossB = Boss.fromName('bossB');
    // bossB.excute();
  });
}
