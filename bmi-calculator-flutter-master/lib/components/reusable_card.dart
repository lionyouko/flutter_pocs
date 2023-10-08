import 'package:flutter/material.dart';

// Custom Widget / Reusable / and with properties in constructor
class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? reusableChild;
  final void Function()? onTapCallBack;

  ReusableCard({required this.colour, this.reusableChild, this.onTapCallBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallBack,
      child: Container(
        child: reusableChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: this.colour,
        ),
      ),
    );
  }
}
