import 'package:flutter/material.dart';

// in future may be a good idea to have a "design" file in which all the properties can be get and filled to the objects themselves. A pseudo extract, like extracting strings in android

const bottonContainerHeight = 80.0;
const reusableCardBackgroundColor = Color(0xFF1D1E33);
const bottonContainerBackgroundColor = Color.fromARGB(221, 235, 37, 37);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(reusableCardBackgroundColor),
                ),
                Expanded(
                  child: ReusableCard(reusableCardBackgroundColor),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(reusableCardBackgroundColor),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(reusableCardBackgroundColor),
                ),
                Expanded(
                  child: ReusableCard(reusableCardBackgroundColor),
                )
              ],
            ),
          ),
          Container(
            color: bottonContainerBackgroundColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottonContainerHeight,
          )
        ],
      ),
    );
  }
}

// Custom Widget / Reusable / and with properties in constructor
class ReusableCard extends StatelessWidget {
  final Color _colour;

  ReusableCard(this._colour);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: _colour,
      ),
    );
  }
}
