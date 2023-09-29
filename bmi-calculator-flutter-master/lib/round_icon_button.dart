import 'package:flutter/material.dart';

//This widget is basically a composition of others, but more than that, it is also more basic customized than just changing properties, or chanaging the theme.
class RoundIconButton extends StatelessWidget {
  final IconData? icon;

  const RoundIconButton({this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Color(0XFF4C4F5E),
      elevation: 6.0,
      //this value came after investigating how floating action button was built. The constants in the code leads to find this constraints and elevation too. The class C132 is about learning how to build even more custom widgets, like this one.
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
