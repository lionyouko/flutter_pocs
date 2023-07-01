

void main(){

  Car c1 = new Car();
  c1.color = "red";
  c1.drive();

// ways to use functions from classes:

c1.numberWheels = 3; //because it is a set keyworded method, it uses like this. It makes it looks like public attribute

// you can get the runtimeType of an object with the property .runtimeType, as in
// c1.runtimeType
// but use c1 is Type instead of c1.runtimeType == Type for checking type

  /**
   *  Dart is object-oriented with classes and mixin-based inheritance (which we will not use)
   *  All classes descend from Object (aside from Null)
   *  Syntax is below
   *    class Car {
   *      late String color;
   * 
   *      void drive(){
   *        print('car color $color is moving')
   *      }
   * 
   *    }
   * 
   */
}

//implicit constructor
class Car {
  late String color; //public

  late int? _wheels; //private

  //setter
  set numberWheels(int wheels) {
      this._wheels = wheels;
  }

  //getter
  int get wheels => _wheels!;

  void drive() {
    print('Car of color $color is moving.');

  }

}

// other syntax for attributes, becasue using ?, all starts with null
// All instance variables generate an implicit getter method. 
// Non-final instance variables and late final instance variables without initializers also generate an implicit setter method
// implicit constructor
class Point {
  double? x; // Declare instance variable x, initially null.
  double? y; // Declare y, initially null.
  double z = 0; // Declare z, initially 0.
}

// Instance variables can be final, in which case they must be set exactly once. 
// Initialize final, non-late instance variables at declaration
// explicit constructor
class ProfileMark {
  final String name;
  final DateTime start = DateTime.now();

  ProfileMark(this.name);
  ProfileMark.unnamed() : name = '';
}


// all classes define an implicity interface for it by the which anyone can use them as interface
// A person. The implicit interface contains greet().
// to implement more than one interface, just use comma as in class Implementer implements Interface1, Interface2, ...
class Person {
  // In the interface, but visible only in this library.
  final String _name;

  // Not in the interface, since this is a constructor.
  Person(this._name);

  // In the interface.
  String greet(String who) => 'Hello, $who. I am $_name.';
}

// An implementation of the Person interface.
class Impostor implements Person {
  String get _name => '';

  String greet(String who) => 'Hi $who. Do you know who I am?';
}

String greetBob(Person person) => person.greet('Bob');

// interfaces again
class Audi implements Car {

  Audi({required this.color});
  
  @override
  int? _wheels;
  
  @override
  String color;
  
  @override
  void drive() {
    // TODO: implement drive
  }
  
  @override
  set numberWheels(int wheels) {
    // TODO: implement numberWheels
  }
  
  @override
  // TODO: implement wheels
  int get wheels => throw UnimplementedError();


}

// task 5: contact app
class Contact {
  String? contactName;
  
  Contact({this.contactName});

  // https://dart.dev/tools/linter-rules/hash_and_equals
  // one can use equatable: https://pub.dev/packages/equatable
  @override
  bool operator ==(Object other) =>
      other is Contact && 
      other.runtimeType == runtimeType && 
      contactName == other.contactName;

  @override
  int get hashCode => contactName.hashCode;

}

class ContactApplication {

  late List<Contact> _contactList;

  void addNewContact({required Contact newContact}){
    this._contactList.add(newContact);

  }

  void displayContacts(){
    // we have terciary operator
    _contactList.isEmpty ? _contactList.forEach(print): print("No customers");

  }

  bool deleteContact({required Contact contactToRemove}){
    if (_contactList.remove(contactToRemove)){
      return true;
    } else { 
      print("No Customer with that name");
      return false;
    }

  }

}

// Inheritance and Mixims

// it works as in Java, you just add the extras needed. 
// When mixin, use with keyword
class McQueen extends Car with Catchau {

  int _lights = 0;

  int get lights => _lights;


}

mixin Catchau {
  void catchau(){
    print("CATCHAU!");
  }

}

// A mixin declaration defines a mixin. 
// A class declaration defines a class. 
// A mixin class declaration defines a class that is usable as both a regular class and a mixin, with the same name and the same type.

