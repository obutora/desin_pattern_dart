// excute()をもつCommandインターフェースを作成
// 何が実行されるかは、実装クラスによって決まる
abstract class Command {
  String execute();
  String undo();
}

// LightCommandはexcute()によって、Light.on()を実行する
// LightクラスはどのLightでも対応できる抽象クラスとした
class LightCommand implements Command {
  Light light;
  LightCommand(this.light);

  @override
  String execute() => light.on();

  @override
  String undo() => light.off();
}

class NoCommand implements Command {
  @override
  String execute() => '';

  @override
  String undo() => '';
}

abstract class Light {
  String on();
  String off();
}

class LEDLight implements Light {
  @override
  on() => 'LED Light on';

  @override
  off() => 'LED Light off';
}

class CandleLight implements Light {
  @override
  on() => 'Candle Light on';

  @override
  off() => 'Candle Light off';
}

// AirConditionerCommandはexcute()によって、AirConditioner.on()を実行する
// このように、Commandの実装によってon()でもdown()でもなんでも実行できる
class AirConditionerOnCommand implements Command {
  AirConditioner airConditioner;
  AirConditionerOnCommand(this.airConditioner);

  @override
  String execute() => airConditioner.on();

  @override
  String undo() => airConditioner.off();
}

class AirConditionerDownCommand implements Command {
  AirConditioner airConditioner;
  AirConditionerDownCommand(this.airConditioner);

  @override
  String execute() => airConditioner.down();

  @override
  String undo() => airConditioner.up();
}

class AirConditioner {
  String on() => 'AirConditioner on';
  String off() => 'AirConditioner off';
  String down() => 'AirConditioner down';
  String up() => 'AirConditioner up';
}

// ControllerはCommandを受け取り、excute()を実行する
// どのCommandが実行されるかは、外部から注入されるCommandによって決まる
class Invoker {
  late Command command;
  Command preCommand = NoCommand();

  setCommand(Command command) {
    this.command = command;
  }

  String excute() {
    preCommand = command;
    return command.execute();
  }

  String undo() => preCommand.undo();
}

class MacroCommand implements Command {
  List<Command> commands = [];

  MacroCommand(this.commands);

  @override
  String execute() {
    String res = '';
    for (Command command in commands) {
      res += '${command.execute()}\n';
    }
    return res;
  }

  @override
  String undo() {
    String res = '';
    for (Command command in commands) {
      res += command.undo();
    }
    return res;
  }
}

abstract class Boss {
  Boss();

  void prepare();
  void commonTime() {
    print('commonTime');
  }

  void attack();
  void escape();

  void excute() {
    prepare();
    commonTime();
    attack();
    escape();
  }

  factory Boss.fromName(String name) {
    if (name == 'bossA') {
      return BossA();
    } else if (name == 'bossB') {
      return BossB();
    } else {
      throw Exception('boss not found');
    }
  }
}

class BossA extends Boss {
  BossA();

  @override
  void attack() {
    print('attackA');
  }

  @override
  void escape() {
    print('escapeA');
  }

  @override
  void prepare() {
    print('prepareA');
  }
}

class BossB extends Boss {
  BossB();

  @override
  void attack() {
    print('attackB');
  }

  @override
  void commonTime() {
    print('override commonTime only bossB');
  }

  @override
  void escape() {
    print('escapeB');
  }

  @override
  void prepare() {
    print('prepareB');
  }
}
