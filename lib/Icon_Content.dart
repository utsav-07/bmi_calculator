
import 'package:bmi_calculator/Constatnts.dart';
import 'package:flutter/material.dart';


class IconContent extends StatelessWidget {
  final IconData icon;
  final String name;

  IconContent({required this.icon , required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          this.name,
          style: nameTextStyle,
        ),
      ],
    );
  }
}