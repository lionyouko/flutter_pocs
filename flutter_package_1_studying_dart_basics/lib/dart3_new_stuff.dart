

void main(){
  // records

  final (first, last) = records();
  print(first);
  print(last);

}

// this is a record (a, b)
// it is good to create small code bytes that looks like complex data
(String, String) records() {
  final firstName = "Lion";
  final lastName = "Lions";

  return (firstName, lastName);
}

// improved switch cases:
// works also with custom classes
String describeData(DateTime dt) => 
  switch(dt.weekday) {
    1 => "Monday",
    6 || 7 => "Weekend",
    _ => "Week is running",

  };


// You can make switch evaluates a function polymorphcally depending on the type of the base class

String whatDoesItSound(Animal animal) => switch (animal) {
  Cow c => '$c moo',
  Sheep s => '$s baaa',
  Pig _ => 'oink',
  // it MUST BE EXAUSTIVE
};

sealed class Animal {}
class Cow extends Animal {}
class Sheep extends Animal {}
class Pig extends Animal {}