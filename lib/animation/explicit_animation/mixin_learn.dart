class Animal{
  void eat(){
    print('Animal is eating');
  }
}

class Dog extends Animal{
  void bark(){
    print('Dog is barking');
  }
}

void main()
{
  Dog mithran = Dog();
  mithran.bark();
  mithran.eat();
  Cat neeli = Cat();

}


mixin Swimmer {
  void swim(){
    print('Swimmer is in water');
  }
}

mixin Cricketer{
  void match(){
    print('Cricketer is in ground');
  }
}

class Cat extends Animal with Swimmer,Cricketer {
  void attitude(){
    print('Cat has attitude');
  }
}