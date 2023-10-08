import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

const iconSize = 80.0;
const sizedBoxHeight = 15.0;

const defaultStringIfNoLabel = "";

// Custom Widget / Reusable / and with properties in constructor
class ReusableCardChildContent extends StatelessWidget {
  final IconData? iconDataOfCardChildContent;
  final String? stringOfCardChildContent;

  const ReusableCardChildContent(
      this.iconDataOfCardChildContent, this.stringOfCardChildContent);

  @override
  Widget build(BuildContext context) {
    return Column(
      //c128: without the mainAxis, he column's content will not be centered in the parent. By centering it, we solve the problem of column on very top.
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconDataOfCardChildContent,
          size: iconSize,
        ),
        SizedBox(height: sizedBoxHeight),
        Text(
          stringOfCardChildContent ?? defaultStringIfNoLabel,
          style: labelStyle,
        ),
      ],
    );
  }
}
