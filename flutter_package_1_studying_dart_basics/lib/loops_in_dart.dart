
void main() {
  /*
  
  types of loops in dart:

  - while:
      while (!isDone()) {
        doSomething();
      }

      while (true) {
        if (shutDownRequested()) break;
        processIncomingRequests();
      }


  - do-while (execute at least once):
      do {
        printLine();
      } while (!atEndOfPage());

  - for (either traditional C stype or Python "in" style):
    var callbacks = [];
    for (var i = 0; i < 2; i++) {
      callbacks.add(() => print(i));
    }

    for (final c in callbacks) {
      c();
    }

    for (int i = 0; i < candidates.length; i++) {
      var candidate = candidates[i];
      if (candidate.yearsExperience < 5) {
        continue;  // continue jumps to the next iteration
      }
      candidate.interview();
    }


  - forEach(myFunction) (for Iterable types as List, Map, Set):
    collection.forEach(print)  //cannot manipulate the list while iterating over i

    It can be function defined at spot:
    collection.forEach((element) {
      print(element);
    }) //each element is a copy of the element of the list, so u can manipualte, but list itself will not change
  
    Other functional style:
    candidates
      .where((c) => c.yearsExperience >= 5)
      .forEach((c) => c.interview());

    

  */
}