import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 44, 135, 94),
        body: SafeArea(
          child: Center(
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/lion.jpeg'),
                ),
                Text('Lion',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
                ),
                Text('Flutter Developer',
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'PT-Sans',
                ),
                ),
                SizedBox(
                  height: 20,
                  width: 150,
                  child: Divider(
                    color: Colors.amberAccent,
                  ),
                ),
                Card(
                  color: Colors.white70,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Row(
                    children: [
                      Icon(Icons.phone,
                      size: 35,
                      color: Colors.black54
                      ),
                      SizedBox(width: 25,),
                      Text('+351 351 351 351'),
                    ],
                    ),
                  ),
                ),
                Card( 
                  color: Colors.white70,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: ListTile( //This one has ListTile and the other is by hand 
                      leading: Icon(Icons.email,
                      size: 35,
                      color: Colors.black54
                      ),
                      title: Text('lion at yahoo dot com '
                      ),
                    ),
                  ),
                )
              ],
            ),
          )

        ),
      ),
    );
  }
}
