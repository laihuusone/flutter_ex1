import 'package:flutter/material.dart';

class TextDividerWidget extends StatelessWidget {
  const TextDividerWidget({
    Key? key,
    required this.text,
    this.textSize = 14,
    this.textColor = Colors.black,
    this.dividerWidth = 80,
    this.dividerHeight = 50,
    this.dividerIndent = 0,
    this.dividerEndIndent = 0,
    this.dividerThickness = 0.5,
    this.dividerColor = Colors.grey,
  }) : super(key: key);

  final String text;
  final double textSize;
  final Color textColor;
  final double dividerWidth;
  final double dividerHeight;
  final double dividerIndent;
  final double dividerEndIndent;
  final double dividerThickness;
  final Color dividerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          dividerMethod(dividerWidth, dividerHeight, dividerIndent,
              dividerEndIndent, dividerThickness, dividerColor),
          Text(
            text,
            style: TextStyle(
              fontSize: textSize,
              color: textColor,
            ),
          ),
          dividerMethod(dividerWidth, dividerHeight, dividerEndIndent, 
              dividerIndent, dividerThickness, dividerColor),
        ],
      ),
    );
  }

  Container dividerMethod(double width, double height, double indent,
      double endIndent, double thickness, Color color) {
    return Container(
      width: width,
      child: Divider(
        height: height,
        thickness: thickness,
        color: color,
        indent: indent,
        endIndent: endIndent,
      ),
    );
  }
}
