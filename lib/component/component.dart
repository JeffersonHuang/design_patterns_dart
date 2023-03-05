/// Component 组合模式
/// 1. 组合模式允许你将对象组合成树形结构，并且能像使用独立对象一样使用它们。
/// 2. 组合模式可以让你有更灵活的结构，同时不会让客户端代码和复杂的树形结构耦合在一起。
/// 3. 组合模式是一种结构型模式。

/// [Component] 是组合模式的基础接口， 它声明了在整个组合结构中所有对象都共有的行为。
abstract class Component {
  late Component? parent;

  void setParent(Component? parent) {
    this.parent = parent;
  }

  Component? getParent() {
    return parent;
  }

  void add(Component component) {}

  void remove(Component component) {}

  bool isComposite() {
    return false;
  }

  String operation();
}

/// [Leaf] 是组合中的叶节点对象， 它没有子节点， 用于实现在组合中定义的基本行为。
class Leaf extends Component {
  @override
  String operation() {
    return 'Leaf';
  }
}

/// [Composite] 是组合中的容器对象， 它有子节点， 用于存储子部件，
/// 并在Component接口中实现与子部件有关的操作。
class Composite extends Component {
  final children = <Component>[];

  @override
  void add(Component component) {
    children.add(component);
    component.setParent(this);
  }

  @override
  void remove(Component component) {
    children.remove(component);
    component.setParent(null);
  }

  @override
  bool isComposite() {
    return true;
  }

  @override
  String operation() {
    final results = [];
    for (var child in children) {
      results.add(child.operation());
    }
    return 'Branch (${results.join(', ')})';
  }
}

/// [clientCode] 通过组合树中的基本对象使用组合结构。
void clientCode(Component component) {
  print('clientCode ${component.operation()}');
}

/// [clientCode2] 通过组合树中的基本对象使用组合结构。
void clientCode2(Component component1, Component component2) {
  if (component1.isComposite()) {
    component1.add(component2);
  }
  print('clientCode2 ${component1.operation()}');
}

/// [main] 除了基本的组件， 组合模式还允许你将对象组合成树形结构，
int main() {
  final simple = Leaf();
  print('单个component: ');
  clientCode(simple);

  final tree = Composite();
  final branch1 = Composite();

  final leaf1 = Leaf();
  final leaf2 = Leaf();
  final leaf3 = Leaf();
  branch1
    ..add(leaf1)
    ..add(leaf2);

  final branch2 = Composite();
  branch2.add(leaf3);

  tree
    ..add(branch1)
    ..add(branch2);
  print('Composite 树');
  clientCode(tree);

  print('管理Composite 树');
  clientCode2(tree, simple);

  return 0;
}
