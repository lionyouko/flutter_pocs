


// Future represents a value that is deliver async
// Streams are similar, but they can return null, or 0 to n values, or errors OVER TIME.
// to listen a stream, you need .listen

// sync:  int         | List<int>
// async: Future<int> | Stream<int>

// example: reading a File (the bytes can be like stream / or objects of it can be stream)
// every time each bit is read, somebody can listen the stream to do something with it (be notified by the read of that part)

import 'dart:async';

void main(){
  Stream numberStream = NumberGenerator().getStream.asBroadcastStream();

  StreamSubscription sub1 = numberStream.listen((event) {
    print(event);
  },
    onDone: () {
      print("DONE");
    },

    onError: (error) {
      print("ERROR");
    },

    cancelOnError: true,
  );
}

class NumberGenerator {
  int _counter = 0;

  final StreamController<int> _controller = StreamController<int>();

  Stream<int> get getStream => _controller.stream;

  NumberGenerator(){
    final timer = Timer.periodic(Duration(seconds: 1), (timer){
      _controller.sink.add(_counter);
      _counter++;
      
    });

    Future.delayed(Duration(seconds: 10), () {
      timer.cancel();
    });

  }



}