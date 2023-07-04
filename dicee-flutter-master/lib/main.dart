import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

// Mutable
/**
 * Stateful Widgets are mutable.
 * They need to override a method called createState that is triggered once the widget is inflated and inserted in Widgets tree.
 * 
 * that Method os of type State<OurWidgetClass> and it will evoke the creation of a class
 * that we need to implement (OurWidgetClass) and its parent is State<OurWidgetClass>.
 * 
 * Inside State<OurWidgetClass> we can set variables.
 * 
 * It will contain the build method where we put our UI code just as Stateless Widget.
 * 
 * Since it is stateful, when we reload or rebuild, it should change what was changed (variables values, for example). 
 * It does change, however, it may not appear in the screen. For that, we need to mark the things that changed in some way and that way is by the use of setState() method. 
 * 
 * When setState is called, all inside of it will be set as "dirty" when when a reload is done. Then, the build method will have a elements market as dirty, meaning they must be updated to the most recent value. Then it does that on rebuild.
 * 
 */
class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // This part does not change in scope of class, it is normal as any class
  int _leftDiceNumber = 1;
  int _rightDiceNumber = 2;

  // You exteds, so you can add whatever you need, just as normal
  int _generateNewNumberForDice() {
    return Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  _leftDiceNumber = _generateNewNumberForDice();
                });
              },
              child: Image.asset('images/dice$_leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  _rightDiceNumber = _generateNewNumberForDice();
                });
              },
              child: Image.asset('images/dice$_rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
