/// Prototype 原型模式
/// 1. 原型模式是一种创建型设计模式， 它通过复制现有对象来生成新对象，
/// 2. 无需知道创建细节。
/// 3. 原型模式是一种对象创建型模式。

/// [Prototype] 声明一个克隆自身的接口。
class Prototype {
  String name;
  Prototype(this.name);
  Prototype clone() => Prototype(name);
}

/// 客户端代码可以通过组合或者继承的方式来扩展对象的功能。
void main() {
  final prototype = Prototype('prototype');
  final prototype2 = prototype.clone();
  print(prototype2.name);
}