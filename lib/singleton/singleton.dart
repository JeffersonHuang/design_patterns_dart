/// Singleton 单例模式
/// 1. 它能确保一个类只有一个实例，
/// 2. 同时提供一个访问该实例的全局访问点。
/// 3. 单例模式是一种对象创建型模式。
/// 4.单例模式被广泛应用于系统中需要频繁创建和销毁的对象，
/// 单例违法了单一职责原则，因为它既负责创建对象，又负责管理单例。
/// 5. 单例模式的优点是在内存里只有一个实例，减少了内存开销；
/// 缺点是不能有多个实例，一旦出现问题，整个系统都会受到影响。
/// 6. 单例模式的使用场景：
/// 6.1. 需要频繁实例化然后销毁的对象；
/// 6.2. 创建对象时耗时过多或者耗资源过多，但又经常用到的对象；
/// 6.3. 有状态的工具类对象；
/// 6.4. 频繁访问数据库或文件的对象。

class Singleton {
  static final Singleton _singleton = Singleton._internal();

  //同时定义了同名的工厂构造函数和默认构造函数，
  // 那么在创建对象实例时，
  // Dart会优先调用工厂构造函数，而忽略默认构造函数。
  factory Singleton() {
    return _singleton;
  }

  //构造函数的选择是根据传入的参数类型和数量来决定的，
  // 如果两个构造函数的参数类型和数量相同，
  // 则Dart会优先选择工厂构造函数。
  // 如果两个构造函数的参数类型和数量不同，
  // 则可以根据传入的参数类型和数量来匹配合适的构造函数。
  Singleton._internal();
}
/// 这种实现方式将获取单例对象的代码封装在
/// get singleton 方法中，使得代码更加简洁明了。
/// 同时，这种实现方式也利用了 Dart 中的 null-aware operators（空值安全运算符）
/// 和 null-coalescing operator（空值合并运算符）来简化代码。
class XXXSingleton {
  XXXSingleton._();

  static XXXSingleton? _singleton;

  static XXXSingleton get singleton => XXXSingleton();

  factory XXXSingleton() => _singleton ??= XXXSingleton._();

}

void main() {
  final singleton = Singleton();
  final singleton2 = Singleton();
  print(identical(singleton, singleton2));

  final singleton3 = XXXSingleton.singleton;
  final singleton4 = XXXSingleton.singleton;
  print(identical(singleton3, singleton4));

}
