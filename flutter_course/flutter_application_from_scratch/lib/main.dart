import 'package:flutter/material.dart';

// Starting point of all flutter Apps
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('I am Rich',
          ),
          backgroundColor: Colors.blueGrey[900],
        ),
        backgroundColor: Colors.blueGrey.shade200,
        body: Center(
          child: Image(
            image: AssetImage(
              'images/diamond_image.jpeg'
            ),
          ),
          ),
        ),
      ),
  );
}
