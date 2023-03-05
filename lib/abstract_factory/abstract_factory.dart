/// Abstract Factory 抽象工厂模式
/// 1. 提供一个创建一系列相关或相互依赖对象的接口，而无需指定它们具体的类。
/// 2. 抽象工厂模式可以将客户端与具体的工厂解耦，客户端只需要知道抽象工厂的接口即可。
/// 3. 抽象工厂模式可以让你的代码在不需要修改的情况下，就能够扩展到新的产品种类中。

/// [AbstractProductA] 定义抽象产品A
abstract class AbstractProductA {
  String usefulFunctionA();
}

/// [ConcreteProductA1] 具体产品A1
class ConcreteProductA1 extends AbstractProductA {
  @override
  String usefulFunctionA() {
    return 'The result of the product A1.';
  }
}

/// [ConcreteProductA2] 具体产品A2
class ConcreteProductA2 extends AbstractProductA {
  @override
  String usefulFunctionA() {
    return 'The result of the product A2.';
  }
}

/// 根据业务需要可以创建A3、A4等

/// [AbstractFactory] 定义抽象工厂
abstract class AbstractFactory {
  AbstractProductA createProductA();
}

/// [ConcreteFactory1] 具体工厂1
class ConcreteFactory1 extends AbstractFactory {
  @override
  AbstractProductA createProductA() {
    return ConcreteProductA1();
  }
}

void clientCode(AbstractFactory abstractFactory) {
  AbstractProductA abstractProductA = abstractFactory.createProductA();
  print('ClientCode ${abstractProductA.usefulFunctionA()}');
}

void main() {
  ConcreteFactory1 f1 = ConcreteFactory1();
  clientCode(f1);
}
