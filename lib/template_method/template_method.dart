/// Template Method 模板方法
/// 1. 定义一个操作中的算法的骨架，而将一些步骤延迟到子类中。
///    得子类可以不改变一个算法的结构即可重定义该算法的某些特定步骤。
/// 2. 一次性实现一个算法的不变的部分，并将可变的行为留给子类来实现。
/// 3. 各子类中公共的行为被提取出来并集中到一个公共父类中以避免代码重复。
/// 4. 控制子类扩展。模板方法只在特定点调用“hook”操作，这样就只允许在这些点进行扩展。
/// 5. 依赖于抽象类的实现。在模板方法中，这些抽象类的方法由它们的子类实现。

/// [AbstractClass] 定义算法的骨架，即算法的骨架，不变的部分
abstract class AbstractClass {
  /// 定义算法中的基本操作，由子类实现
  void primitiveOperation1();

  /// 定义算法中的基本操作，由子类实现
  void primitiveOperation2();

  /// 定义算法骨架，即算法的骨架，不变的部分
  void templateMethod() {
    primitiveOperation1();
    primitiveOperation2();
  }
}

/// [ConcreteClass1] 和 [ConcreteClass2] 是实现 [AbstractClass] 接口的具体算法
class ConcreteClass1 extends AbstractClass {
  @override
  void primitiveOperation1() {
    print('ConcreteClass1.primitiveOperation1');
  }

  @override
  void primitiveOperation2() {
    print('ConcreteClass1.primitiveOperation2');
  }
}

class ConcreteClass2 extends AbstractClass {
  @override
  void primitiveOperation1() {
    print('ConcreteClass2.primitiveOperation1');
  }

  @override
  void primitiveOperation2() {
    print('ConcreteClass2.primitiveOperation2');
  }
}

void clientCode(AbstractClass abstractClass) {
  abstractClass.templateMethod();
}

int main() {
  final concreteClass1 = ConcreteClass1();
  clientCode(concreteClass1);
  final concreteClass2 = ConcreteClass2();
  clientCode(concreteClass2);
  return 0;
}
