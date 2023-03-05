/// Strategy 策略模式
/// 1. 定义一系列算法，把他们一个个封装起来，并且使他们可以相互替换
/// 2. 策略模式让算法独立于使用它的客户而独立变化
/// 3. 策略模式可以避免使用多重条件转移语句
/// 4. 策略模式提供了对开放-封闭原则的完美支持，
///    可以在不修改原代码的情况下，灵活地增加新的策略或者替换现有的策略
/// 5. 策略模式中的算法也可以复用在系统的其他地方，从而避免许多重复的复制粘贴工作

/// [Strategy] 是一个抽象类，它定义了一个算法族，分别封装起来，让他们之间可以互相替换，
abstract class Strategy {
  List doOperation(List data);
}

/// [Context] 是一个使用 [Strategy] 的类
class Context {
  Strategy strategy;

  Context(this.strategy);

  // 设置策略
  setStrategy(Strategy strategy) {
    this.strategy = strategy;
  }

  // 执行策略
  void executeStrategy() {
    final res = strategy.doOperation([1, 2, 3, 4, 5]);
    print('res: $res');
  }
}

/// [ConcreteStrategyA] 和 [ConcreteStrategyB] 是实现 [Strategy] 接口的具体算法
class ConcreteStrategyA implements Strategy {
  @override
  List doOperation(List data) {
    return data.reversed.toList();
  }
}

class ConcreteStrategyB implements Strategy {
  @override
  List doOperation(List data) {
    data.sort();
    return data;
  }
}

int main() {
  // Strategy A sort List;
  final context = Context(ConcreteStrategyA());
  context.executeStrategy();
  // Strategy B reverse List;
  context.setStrategy(ConcreteStrategyB());
  context.executeStrategy();

  return 0;
}
