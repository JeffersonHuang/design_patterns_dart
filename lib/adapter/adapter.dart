/// Adapter 适配器模式
/// 1. 适配器模式可以将一个类的接口转换成客户希望的另外一个接口。
/// 2. 适配器让原本接口不兼容的类可以合作无间。
/// 3. 适配器模式是一种结构型模式。

/// [Target]目标接口
class Target {
  String request() {
    return 'Target: The default target is behavior.';
  }
}

/// [Adaptee] 需要适配的类
class Adaptee {
  String specificRequest() {
    return '.eetpadA eht fo roivaheb laicepS';
  }
}

/// [Adapter] 适配器
class Adapter extends Target {
  final Adaptee _adaptee;

  Adapter(this._adaptee);

  @override
  String request() {
    String toReverse = _adaptee.specificRequest();
    toReverse = reverse(toReverse);
    return 'Adapter: (translated) $toReverse';
  }

  String reverse(String str) {
    String res = '';
    for (var i = str.length - 1; i >= 0; i--) {
      res += str[i];
    }
    return res;
  }
}

/// [clientCode] 客户端代码
void clientCode(Target target) {
  print(target.request());
}

int main() {
  final target = Target();
  clientCode(target);
  final adaptee = Adaptee();
  print(adaptee.specificRequest());
  final adapter = Adapter(adaptee);
  clientCode(adapter);
  return 0;
}
