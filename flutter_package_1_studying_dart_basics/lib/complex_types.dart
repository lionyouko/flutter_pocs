void main(){
  print("Non-primitive Datatypes");


  // Lists: https://dart.dev/language/collections#lists

  /* dart follows lists as normal: index at zero, 
   one can get the length of the list by .length property
   access is by index like int myVar = myArray[0];
   a List literal: List list = [1,2,3];
   Lists can hold one type of value only as above it is a List<int>
   for ints and doubles, one can have a int list but say it is of the type double and Dart will return int values as double instead
   List<double> myList = [1,2,3,4];
   Lists has many other properties, for example .first, .isEmpty, isNotEmpty and you don't need to call it as if it was function
   myList.add(aValue); is possible, it is a method.
  */


  // Maps: https://dart.dev/language/collections#maps
  /*
    Map myMap<String, String> = {
      "this": "this",
      "is": "is",
      "map": "map",
      "literal": "literal"
    }
    It can be myMap<String, dynamic>
    Access is via key, like myMap["is"] willl return "is"

    In Dart ANY TYPE can be KEY. So we will use only String and int as key.
    Map by constructor: var gifts = Map<String, String>(); (the new keyword is optional)
    Map s have also .length property. Also .keys.


  */
}