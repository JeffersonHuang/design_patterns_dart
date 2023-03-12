/// Builder 生成器模式
/// 1. 生成器模式可以让你独立于其他对象的类型构造复杂对象。
/// 2. 生成器模式是一种对象创建型模式。
/// 3. 生成器模式可以将一个复杂对象的构建与它的表示分离，
/// 使得同样的构建过程可以创建不同的表示。

abstract class Builder{
  void buildPartA();
  void buildPartB();
  void buildPartC();
}

/// [ConcreteBuilder] 类是生成器模式的一部分。
class ConcreteBuilder implements Builder{
  Product _product = Product();

  @override
  void buildPartA() {
    _product.add('PartA');
  }

  @override
  void buildPartB() {
    _product.add('PartB');
  }

  @override
  void buildPartC() {
    _product.add('PartC');
  }

  Product getResult(){
    return _product;
  }
}

/// [Product] 类是生成器模式的一部分。
class Product{
  List<String> parts = [];

  void add(String part){
    parts.add(part);
  }

  void show(){
    print('Product parts: ${parts.join(', ')}');
  }
}

/// [Director] 类是生成器模式的一部分。
class Director{
  late Builder _builder;

  void setBuilder(Builder builder){
    _builder = builder;
  }


  // Director.name(this._builder);

  void buildMinimalViableProduct(){
    _builder.buildPartA();
  }

  void buildFullFeaturedProduct(){
    _builder.buildPartA();
    _builder.buildPartB();
    _builder.buildPartC();
  }
}


void main(){
  final director = Director();
  final builder = ConcreteBuilder();
  director.setBuilder(builder);

  print('Standard basic product:');
  director.buildMinimalViableProduct();
  builder.getResult().show();

  print('Standard full featured product:');
  director.buildFullFeaturedProduct();
  builder.getResult().show();

  print('Custom product:');
  builder.buildPartA();
  builder.buildPartC();
  builder.getResult().show();
}