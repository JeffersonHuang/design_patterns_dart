/// Observer 观察者模式
/// 1. 定义了对象之间的一对多依赖，这样一来，当一个对象改变状态时，它的所有依赖者都会收到通知并自动更新。
/// 2. 观察者模式让耦合松散，因此它易于扩展、维护和重用。
/// 3. 观察者模式可以实现广播通信，它支持“发布-订阅”模式。

/// [Observer] 是一个抽象类，它定义了一个更新接口给那些在目标发生改变时被通知的对象。
abstract class Observer {
  void update();
}

/// [Subject] 是一个抽象类，它定义了一个绑定观察者对象和解绑观察者对象的接口。
abstract class Subject {
  void attach(Observer observer);

  void detach(Observer observer);
}

/// [ConcreteSubject] 是目标类，它知道它的观察者，并提供注册（添加）和删除观察者对象的接口。
class ConcreteSubject extends Subject {
  final List<Observer> _observers = [];

  @override
  void attach(Observer observer) {
    if (_observers.contains(observer)) {
      print('Observer already attached');
      return;
    }
    _observers.add(observer);
  }

  @override
  void detach(Observer observer) {
    if (_observers.contains(observer)) {
      print('Observer not attached');
      return;
    }
    _observers.remove(observer);
  }

  void notify() {
    for (var observer in _observers) {
      observer.update();
    }
  }

  void someBusinessLogic() {
    print('ConcreteSubject: I\'m doing something important');
    notify();
  }
}

/// [ConcreteObserverA] 和 [ConcreteObserverB] 是观察者类，它们实现了 [Observer] 接口，
class ConcreteObserverA implements Observer {
  @override
  void update() {
    print('ConcreteObserverA notified');
  }
}

/// [ConcreteObserverB] 是观察者类，它们实现了 [Observer] 接口，
class ConcreteObserverB implements Observer {
  @override
  void update() {
    print('ConcreteObserverB notified');
  }
}

int main() {
  final subject = ConcreteSubject();
  final observerA = ConcreteObserverA();
  final observerB = ConcreteObserverB();
  subject.attach(observerA);
  subject.attach(observerB);
  subject.notify();
  subject.someBusinessLogic();
  return 0;
}
