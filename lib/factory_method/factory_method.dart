/// Factory Method 抽象工厂模式
/// 1. 定义一个用于创建对象的接口，让子类决定实例化哪一个类。
/// 2. 工厂方法使一个类的实例化延迟到其子类。

/// [Product] 是一个抽象类，它定义了工厂方法所创建的对象的接口。
abstract class Product {
  String operation();
}

/// [ConcreteProduct1] 是工厂方法所创建的对象的具体类。
class ConcreteProduct1 extends Product {
  @override
  String operation() {
    return 'Result of the ConcreteProduct 1';
  }
}

/// [ConcreteProduct2] 是工厂方法所创建的对象的具体类。
class ConcreteProduct2 extends Product {
  @override
  String operation() {
    return 'Result of the ConcreteProduct 2';
  }
}

/// [Creator]  类声明返回产品对象的工厂方法。 该方法的返回对象类型必须与产品接口相匹配。
abstract class Creator {
  Product factoryMethod();

  String someOperation() {
    final product = factoryMethod();
    return 'creator ${product.operation()}';
  }
}

/// [ConcreteCreator1] 具体创建者 （Concrete Creators） 将会重写基础工厂方法，
/// 使其返回不同类型的产品。
class ConcreteCreator1 extends Creator {
  @override
  Product factoryMethod() {
    return ConcreteProduct1();
  }
}

/// [ConcreteCreator2] 具体创建者 （Concrete Creators） 将会重写基础工厂方法，
class ConcreteCreator2 extends Creator {
  @override
  Product factoryMethod() {
    return ConcreteProduct2();
  }
}

void clientCode(Creator creator) {
  print('clientCode: ${creator.someOperation()}');
}

int main() {
  print('ConcreteCreator1');
  final creator = ConcreteCreator1();
  clientCode(creator);

  print('ConcreteCreator2');
  final creator1 = ConcreteCreator2();
  clientCode(creator1);
  return 0;
}
