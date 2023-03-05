/// Decorator 模式
/// 1. 动态地给一个对象添加一些额外的职责。就增加功能来说，
///    Decorator 模式相比生成子类更为灵活。
/// 2. 装饰器模式可以在不改变原有对象的基础上，将功能附加到对象上。
///    提供了比继承更有弹性的替代方案（扩展原有对象的功能）。
/// 3. 装饰器模式是一种对象结构型模式。

/// 部件[Component] 声明封装器和被封装对象的公用接口。
abstract class Component {
  String operation();
}

/// 具体部件 [ConcreteComponent] 类是被封装对象所属的类。
/// 它定义了基础行为， 但装饰类可以改变这些行为。
class ConcreteComponent extends Component {
  @override
  String operation() {
    return 'concreteComponent';
  }
}

/// [Decorator] 通过将对象放入特殊包装对象中来为其添加新功能。
class Decorator extends Component {
  late Component component;

  Decorator(this.component);

  @override
  String operation() {
    return component.operation();
  }
}

/// [ConcreteDecoratorA] 通过将对象放入特殊包装对象中来为其添加新功能。
class ConcreteDecoratorA extends Decorator {
  ConcreteDecoratorA(super.component);

  @override
  String operation() {
    return 'ConcreteDecoratorA( ${super.operation()} )';
  }
}

/// [ConcreteDecoratorB] 通过将对象放入特殊包装对象中来为其添加新功能。
class ConcreteDecoratorB extends Decorator {
  ConcreteDecoratorB(super.component);

  @override
  String operation() {
    return 'ConcreteDecoratorB( ${super.operation()} )';
  }
}

/// 客户端代码可以通过组合或者继承的方式来扩展对象的功能。
void clientCode(Component component) {
  print('result: ${component.operation()}');
}

int main() {
  final simple = ConcreteComponent();
  clientCode(simple);
  final decorator1 = ConcreteDecoratorA(simple);
  final decorator2 = ConcreteDecoratorB(decorator1);
  clientCode(decorator2);

  return 0;
}
